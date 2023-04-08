import 'package:flutter/material.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/shared/widgets/bottom_bar_no_acc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MainScreenNoAccPage extends StatefulWidget {
  MainScreenNoAccPage({Key? key}) : super(key: key);
  @override
  _MainScreenNoAccPageState createState() => _MainScreenNoAccPageState();
}

class _MainScreenNoAccPageState extends State<MainScreenNoAccPage> {
  late TabsRouter _tabsRouter;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_tabsRouter.canPop()) {
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: AutoTabsScaffold(
        animationDuration: Duration(milliseconds: 0),
        routes: [
          HomeRoute(),
          NewsRoute(),
          //SettingsScreenNoAcc(),
        ],
        bottomNavigationBuilder: (_, TabsRouter tabs) {
          _tabsRouter = tabs;
          return BottomBarNoAcc(tabs);
        },
      ),
    );
  }
}
