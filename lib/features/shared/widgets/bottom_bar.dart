import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/shared/widgets/motionTabBar.dart';
import 'package:guide_liverpool/generated/l10n.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/main_page.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

class BottomBar extends StatelessWidget {
  late final TabsRouter tabsRouter;

  BottomBar(
    this.tabsRouter,
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeScreenViewModel>(
      distinct: true,
      converter: HomeScreenViewModel.fromStore,
      onInit: (store) {
        // store.dispatch(fetchSwapList());
        store.dispatch(startFetchingCall());
        store.dispatch(startFetchTokensBalances());
        store.dispatch(updateTokensPrices());
      },
      builder: (_, vm) => MotionTabBar(
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
          I10n.of(context).account,
          "Shop",
        ],
        icons: [
          Icons.home_outlined,
          Icons.article_outlined,
          Icons.person_outline,
          PeeplIcons.ppl_circles_02,
        ],
      ),
    );
  }
}


// BottomNavigationBar(
//         onTap: (int activeIndex) {
//           if (activeIndex == tabsRouter.activeIndex) {
//             context.router.popTop();
//           } else {
//             tabsRouter.setActiveIndex(activeIndex);
//           }
//         },
//         selectedItemColor: Color(0xFF292929),
//         selectedFontSize: 13,
//         unselectedFontSize: 13,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: tabsRouter.activeIndex,
//         backgroundColor: Theme.of(context).bottomAppBarColor,
//         showUnselectedLabels: true,
//         //To do: Add internationalisation
//         items: [
//           bottomBarItem(I10n.of(context).home, 'home'),
//           bottomBarItem("News", "news"),
//           bottomBarItem('Wallet', 'wallet'),
//           //bottomBarItem('Shop', 'order'),
//           //bottomBarItem('Top Up', 'topup'),
//           // bottomBarItem('Tips', 'tips'),
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: EdgeInsets.only(top: 5, bottom: 3),
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/anom.png'),
//                 radius: 13,
//               ),
//             ),
//             activeIcon: Padding(
//               padding: EdgeInsets.only(top: 5, bottom: 3),
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/anom.png'),
//                 radius: 14,
//               ),
//             ),
//             label: I10n.of(context).account,
//           )
//         ],
//       ),