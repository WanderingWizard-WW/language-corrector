import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:language_corrector/presentation/texts/texts_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: TextsPage,
      path: '/texts',
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(GlobalKey<NavigatorState> navigatorKey) : super(navigatorKey);
}
