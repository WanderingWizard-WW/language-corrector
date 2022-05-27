import 'package:dio/dio.dart';
import 'package:language_corrector/core/utils/string_extension.dart';

class NotFoundException implements Exception {}

class ServerException extends DioError {
  ServerException(
    this.statusCode,
    this.exception,
    RequestOptions requestOptions,
  ) : super(
          requestOptions: requestOptions,
          response: null,
          error: StringExtensions.empty,
        );

  factory ServerException.fromJson(
    RequestOptions requestOptions,
    Map<String, dynamic> json,
  ) =>
      ServerException(
        json['statusCode'],
        json['message'],
        requestOptions,
      );

  final int? statusCode;
  final String exception;
}

class NoInternetException extends DioError {
  NoInternetException(RequestOptions requestOptions)
      : super(
          requestOptions: requestOptions,
          response: null,
          error: StringExtensions.empty,
        );
}

class GeneralException implements Exception {}

class CacheException implements Exception {}
