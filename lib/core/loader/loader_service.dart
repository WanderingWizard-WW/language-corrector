import 'package:flutter/material.dart';
import 'package:language_corrector/core/loader/loader.dart' as loader;

class LoaderService {
  LoaderService(this.navigatorState);

  final GlobalKey<NavigatorState> navigatorState;

  Future<void> showLoader() =>
      loader.showLoader(navigatorState.currentState?.overlay);

  void dismissLoader() => loader.dismissLoader();

  Future<T> wrapInLoader<T>(Future<T> Function() action) async {
    try {
      await showLoader();
      return await action();
    } finally {
      dismissLoader();
    }
  }
}
