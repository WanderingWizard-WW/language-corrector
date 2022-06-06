import 'package:flutter/material.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class EmptyErrorsWidget extends StatelessWidget {
  const EmptyErrorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: Image.asset('assets/images/file.png', fit: BoxFit.contain),
        ),
        const SizedBox(height: 16),
        Text('Чудово!', style: AppTheme.robotoBolt16),
        Text('Помилок не знайдено.', style: AppTheme.robotoRegular14),
      ],
    );
  }
}
