import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/shared/widgets/bottom_bar_no_acc.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';

class MainScreenNoAcc extends StatefulWidget {
  MainScreenNoAcc({Key? key}) : super(key: key);
  @override
  _MainScreenNoAccState createState() => _MainScreenNoAccState();
}

class _MainScreenNoAccState extends State<MainScreenNoAcc> {
  late TabsRouter _tabsRouter;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_tabsRouter.canPopSelfOrChildren) {
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: StoreConnector<AppState, BottomBarViewModel>(
        distinct: true,
        converter: BottomBarViewModel.fromStore,
        builder: (_, vm) => AutoTabsScaffold(
          animationDuration: Duration(milliseconds: 0),
          routes: [
            GuideHomeTab(),
            NewsHomeTab(),
          ],
          bottomNavigationBuilder: (_, TabsRouter tabs) {
            _tabsRouter = tabs;
            return BottomBarNoAcc(tabs);
          },
        ),
      ),
    );
  }
}
