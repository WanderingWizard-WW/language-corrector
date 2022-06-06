import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get_it/get_it.dart';
import 'package:language_corrector/core/di/network_module.dart' as network;
import 'package:language_corrector/core/loader/loader_service.dart';
import 'package:language_corrector/core/routes/app_router.dart';
import 'package:language_corrector/presentation/texts/bloc/texts_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  ///Networking
  network.init();

  ///Data sources

  ///Repository

  ///Navigator
  locator
    ..registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>())
    ..registerSingleton(QuillController.basic())
    ..registerSingleton(AppRouter(locator()))
    ..registerSingleton(LoaderService(locator()))

    ///Blocs
    ..registerFactory(
      () => TextsCubit(dio: locator(), quillController: locator()),
    );

  await locator.allReady();
}
