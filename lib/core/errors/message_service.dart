import 'package:flutter/material.dart';
import 'package:language_corrector/presentation/widgets/app_snackbar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MessageService {
  MessageService(this.navigatorState);

  final GlobalKey<NavigatorState> navigatorState;

  void showError(String message) {
    showTopSnackBar(
      navigatorState.currentContext!,
      AppSnackBar.error(
        message: message,
      ),
      overlayState: navigatorState.currentState?.overlay,
    );
  }

  void showSuccess(String message) {
    showTopSnackBar(
      navigatorState.currentContext!,
      AppSnackBar.success(
        message: message,
      ),
      overlayState: navigatorState.currentState?.overlay,
    );
  }
}
