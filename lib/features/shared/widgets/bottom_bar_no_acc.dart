import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/shared/widgets/motionTabBar.dart';
import 'package:guide_liverpool/generated/l10n.dart';

class BottomBarNoAcc extends StatelessWidget {
  late final TabsRouter tabsRouter;

  BottomBarNoAcc(
    this.tabsRouter,
  );

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      tabIconColor: flexColorSchemeLight.primary!,
      textStyle: TextStyle(color: flexColorSchemeLight.primary),
      tabSelectedColor: flexColorSchemeLight.primary!,
      initialSelectedTab: I10n.of(context).home,
      onTabItemSelected: (int activeIndex) {
        if (activeIndex == tabsRouter.activeIndex) {
          context.router.popTop();
        } else {
          tabsRouter.setActiveIndex(activeIndex);
        }
      },
      labels: [
        I10n.of(context).home,
        "News",
      ],
      icons: [
        Icons.home_outlined,
        Icons.article_outlined,
      ],
    );
  }
}
