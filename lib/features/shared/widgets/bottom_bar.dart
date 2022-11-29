// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:guide_liverpool/constants/theme.dart';
// import 'package:guide_liverpool/features/shared/widgets/motionTabBar.dart';
// import 'package:guide_liverpool/generated/l10n.dart';
// import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

// class BottomBar extends StatelessWidget {
//   late final TabsRouter tabsRouter;

//   BottomBar(
//     this.tabsRouter,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MotionTabBar(
//       tabIconColor: flexColorSchemeLight.primary!,
//       textStyle: TextStyle(color: flexColorSchemeLight.primary),
//       tabSelectedColor: flexColorSchemeLight.primary!,
//       initialSelectedTab: I10n.of(context).home,
//       onTabItemSelected: (int activeIndex) {
//         if (activeIndex == tabsRouter.activeIndex) {
//           context.router.popTop();
//         } else {
//           tabsRouter.setActiveIndex(activeIndex);
//         }
//       },
//       labels: [
//         I10n.of(context).home,
//         "News",
//         I10n.of(context).account,
//         "Community",
//       ],
//       icons: [
//         Icons.home_outlined,
//         Icons.article_outlined,
//         Icons.person_outline,
//         PeeplIcons.ppl_circles_02,
//       ],
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/shared/widgets/salomon_bottom_bar.dart';
import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

class BottomBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  BottomBar(
    this.tabsRouter,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SalomonBottomBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            selectedColor: Theme.of(context).primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.article_outlined),
            title: const Text('News'),
            selectedColor: Theme.of(context).primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_rounded),
            title: const Text('Account'),
            selectedColor: Theme.of(context).primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              PeeplIcons.ppl_circles_02,
            ),
            title: const Text('Community'),
            selectedColor: pplRed,
          ),
        ],
      ),
    );
  }
}
