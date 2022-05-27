import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:language_corrector/presentation/dashboard/dashboard_page.dart';
import 'package:language_corrector/presentation/settings/settings_page.dart';
import 'package:language_corrector/presentation/texts/texts_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: DashboardPage,
      path: '/dashboard',
      initial: true,
      children: [
        AutoRoute(page: TextsPage, path: 'dashboard/texts'),
        AutoRoute(page: SettingsPage, path: 'dashboard/settings'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(GlobalKey<NavigatorState> navigatorKey) : super(navigatorKey);
}
