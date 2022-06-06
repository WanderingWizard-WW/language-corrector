import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_corrector/core/di/injector.dart' as di;
import 'package:language_corrector/core/observers/app_bloc_observer.dart';
import 'package:language_corrector/core/observers/app_router_observer.dart';
import 'package:language_corrector/core/routes/app_router.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

void main() {
  bootstrap(() => const App());
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          await builder(),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stack) {
      log(error.toString(), stackTrace: stack);
    },
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      theme: AppTheme.get(),
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(
        di.locator<AppRouter>(),
        navigatorObservers: () => [AppRouterObserver()],
      ),
      routeInformationParser: di.locator<AppRouter>().defaultRouteParser(),
    );
  }
}
