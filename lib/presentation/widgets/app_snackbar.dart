import 'dart:math';

import 'package:flutter/material.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class AppSnackBar extends StatefulWidget {
  AppSnackBar.success({
    Key? key,
    required this.message,
  })  : textStyle = AppTheme.robotoRegular16.copyWith(
          color: Colors.lightGreen,
        ),
        icon = const Icon(
          Icons.sentiment_very_satisfied,
          color: Colors.lightGreen,
          size: 104,
        ),
        backgroundColor = Colors.lightGreen,
        super(key: key);

  AppSnackBar.error({
    Key? key,
    required this.message,
  })  : textStyle = AppTheme.robotoRegular16.copyWith(color: AppTheme.tartOrange),
        icon = const Icon(
          Icons.error_outline,
          color: AppTheme.tartOrange,
          size: 104,
        ),
        backgroundColor = AppTheme.snowColor,
        super(key: key);

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;

  @override
  AppSnackBarState createState() => AppSnackBarState();
}

class AppSnackBarState extends State<AppSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -20,
            child: SizedBox(
              height: 104,
              child: Transform.rotate(
                angle: 32 * pi / 180,
                child: widget.icon,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 64),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.message,
                  style: theme.textTheme.bodyText2?.merge(
                    widget.textStyle,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
