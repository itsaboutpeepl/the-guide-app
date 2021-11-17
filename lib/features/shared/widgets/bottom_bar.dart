import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peepl/generated/l10n.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/main_page.dart';
import 'package:peepl/redux/actions/cash_wallet_actions.dart';

class BottomBar extends StatelessWidget {
  late final TabsRouter tabsRouter;

  BottomBar(
    this.tabsRouter,
  );

  BottomNavigationBarItem bottomBarItem(
    String title,
    String imgSvg,
  ) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 3),
          child: SvgPicture.asset(
            'assets/images/$imgSvg\.svg',
          ),
        ),
        activeIcon: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 3),
          child: SvgPicture.asset(
            'assets/images/$imgSvg\_selected.svg',
            width: 26,
            height: 26,
          ),
        ),
        label: title,
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
      builder: (_, vm) => BottomNavigationBar(
        onTap: (int activeIndex) {
          if (activeIndex == tabsRouter.activeIndex) {
            context.router.popTop();
          } else {
            tabsRouter.setActiveIndex(activeIndex);
          }
        },
        selectedItemColor: Color(0xFF292929),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        showUnselectedLabels: true,
        //To do: Add internationalisation
        items: [
          bottomBarItem(I10n.of(context).home, 'home'),
          bottomBarItem('Wallet', 'wallet'),
          //bottomBarItem('Shop', 'order'),
          //bottomBarItem('Top Up', 'topup'),
          // bottomBarItem('Tips', 'tips'),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 3),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/anom.png'),
                radius: 13,
              ),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 3),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/anom.png'),
                radius: 14,
              ),
            ),
            label: I10n.of(context).account,
          )
        ],
      ),
    );
  }
}
