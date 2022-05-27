import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_corrector/core/routes/app_router.dart';
import 'package:language_corrector/core/theme/app_theme.dart';
import 'package:language_corrector/presentation/dashboard/widgets/control_bar_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        TextsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: AppTheme.snowColor,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ControlBarItem(
                      title: 'Тексты',
                      icon: FontAwesomeIcons.file,
                      onTap: () {
                        setState(() {
                          tabsRouter.setActiveIndex(0);
                        });
                      },
                      isActive: tabsRouter.activeIndex == 0,
                    ),
                    ControlBarItem(
                      title: 'Настройки',
                      icon: FontAwesomeIcons.sliders,
                      onTap: () {
                        setState(() {
                          tabsRouter.setActiveIndex(1);
                        });
                      },
                      isActive: tabsRouter.activeIndex == 1,
                    ),
                    const Spacer(),
                    const ControlBarItem(
                      title: 'Добавить',
                      icon: FontAwesomeIcons.plus,
                      isActive: true,
                      onTap: null,
                    ),
                  ],
                ),
              ),
              Container(
                height: double.infinity,
                color: Colors.black12,
                width: 1,
              ),
              FadeTransition(
                opacity: animation,
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}
