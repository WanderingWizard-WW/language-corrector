import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:language_corrector/core/di/network_module.dart' as network;
import 'package:language_corrector/core/errors/message_service.dart';
import 'package:language_corrector/core/loader/loader_service.dart';
import 'package:language_corrector/core/routes/app_router.dart';

final locator = GetIt.instance;

Future<void> init() async {
  ///Networking
  network.init();

  ///Data sources

  ///Repository

  ///Navigator
  locator
    ..registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>())
    ..registerSingleton(AppRouter(locator()))
    ..registerSingleton(LoaderService(locator()))
    ..registerSingleton(MessageService(locator()));

  ///Blocs

  await locator.allReady();
}
