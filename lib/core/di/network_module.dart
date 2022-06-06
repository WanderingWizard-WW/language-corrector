import 'package:dio/dio.dart';
import 'package:language_corrector/core/di/injector.dart';
import 'package:language_corrector/core/network/interceptors/error_interceptor.dart';
import 'package:language_corrector/core/network/interceptors/header_interceptor.dart';

const _baseUrl = 'https://api.languagetoolplus.com/v2';

void init() {
  locator.registerLazySingleton<Dio>(() {
    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      contentType: Headers.formUrlEncodedContentType,
    );
    final dio = Dio(baseOptions);
    dio.interceptors.addAll([
      HeaderInterceptor(),
      LogInterceptor(
        request: false,
        responseHeader: false,
        responseBody: true,
      ),
      ErrorInterceptor(),
    ]);
    return dio;
  });
}
