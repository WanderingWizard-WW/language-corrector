import 'package:flutter/material.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class TextsPage extends StatelessWidget {
  const TextsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Texts',style: AppTheme.robotoRegular16,));
  }
}
