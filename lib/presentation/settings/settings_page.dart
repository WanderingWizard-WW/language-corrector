import 'package:flutter/material.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings', style: AppTheme.robotoRegular16),
    );
  }
}
