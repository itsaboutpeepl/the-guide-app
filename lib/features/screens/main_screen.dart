import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/bottom_bar.dart';
import 'package:guide_liverpool/features/shared/widgets/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TabsRouter _tabsRouter;

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   Function handleFCM = (RemoteMessage? remoteMessage) {};

  //   FirebaseMessaging.instance
  //       .getInitialMessage()
  //       .then((RemoteMessage? remoteMessage) {
  //     handleFCM(remoteMessage);
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
  //     handleFCM(remoteMessage);
  //   });

  //   FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
  //     handleFCM(remoteMessage);
  //   });
  //   super.initState();
  // }

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
            HomeTab(),

            // WebviewTab(
            //   children: [
            //     WebViewWidget(
            //       url: 'https://www.shocal.org',
            //       walletAddress: vm.walletAddress,
            //     )
            //   ],
            // ),
            //TopupTab(),
            // HelpTab(),
            // BuyTab(),
            AccountTab(),
            // ContactsTab(),
            // BuyTab(
            //   children: [
            //     vm.isDefaultCommunity
            //         ? FusePointsExplainedScreen()
            //         : BuyScreen(),
            //   ],
            // ),
            // AccountTab(),
          ],
          bottomNavigationBuilder: (_, TabsRouter tabs) {
            _tabsRouter = tabs;
            return BottomBar(tabs);
          },
        ),
      ),
    );
  }
}
