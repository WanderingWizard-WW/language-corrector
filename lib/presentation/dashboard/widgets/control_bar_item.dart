import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_corrector/core/theme/app_theme.dart';

class ControlBarItem extends StatelessWidget {
  const ControlBarItem({
    Key? key,
    this.isActive = false,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        children: [
          Material(
            color: isActive ? AppTheme.skobeloffColor : Colors.white,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                onTap?.call();
              },
              onHover: (event) {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isActive ? AppTheme.skobeloffColor : Colors.black12,
                  ),
                ),
                width: 40,
                height: 40,
                child: Center(
                  child: FaIcon(
                    icon,
                    color: isActive ? AppTheme.ghostWhiteColor : Colors.black54,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: isActive
                ? AppTheme.robotoSemiBolt10
                    .copyWith(color: AppTheme.skobeloffColor)
                : AppTheme.robotoSemiBolt10,
          ),
        ],
      ),
    );
  }
}
