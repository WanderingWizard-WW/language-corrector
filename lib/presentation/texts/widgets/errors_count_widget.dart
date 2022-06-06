import 'package:flutter/material.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class ErrorsCountWidget extends StatelessWidget {
  const ErrorsCountWidget({Key? key, required this.errors}) : super(key: key);
  final int errors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text('Пропозиції', style: AppTheme.robotoSemiBold14),
          const SizedBox(width: 8),
          Text(errors.toString(), style: AppTheme.robotoRegular14),
        ],
      ),
    );
  }
}
