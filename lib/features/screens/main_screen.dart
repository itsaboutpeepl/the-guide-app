import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/firebase_options.dart';
import 'package:guide_liverpool/features/guideHome/helpers/detailArticleBottomModal.dart';
import 'package:guide_liverpool/features/shared/widgets/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TabsRouter _tabsRouter;

  @override
  void initState() {
    firebaseMessaging.getInitialMessage().then(handleFCM);
    startFirebaseNotifs();
    Future.delayed(const Duration(seconds: 5), requestAppTracking);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void>(
      converter: (store) {},
      onInit: (store) {
        store.dispatch(web3Init());
      },
      builder: (context, viewmodel) {
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
              GuideHomeTab(),
              NewsHomeTab(),
              AccountTab(),
              NetworkScreenTab(),
            ],
            bottomNavigationBuilder: (_, TabsRouter tabs) {
              _tabsRouter = tabs;
              return context.topRouteMatch.meta['hideBottomNav'] == true
                  ? const SizedBox.shrink()
                  : BottomBar(tabs);
            },
          ),
        );
      },
    );
  }

  void startFirebaseNotifs() {
    firebaseMessaging.getToken().then((value) => log.info('FCM Token: $value'));
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(handleFCM);

    FirebaseMessaging.onMessage.listen(handleFCM);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage,
  ) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await handleFCM(remoteMessage);
  }

  Future<void> handleFCM(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      int articleID = int.parse(remoteMessage.data['postID']);

      newsService.getArticleByID(articleID).then(
            (article) => showBarModalBottomSheet(
              useRootNavigator: true,
              backgroundColor: Colors.white,
              context: context,
              builder: (context) =>
                  DetailArticleBottomModel(articleData: article),
            ),
          );
    }
  }
}

Future<void> requestAppTracking() async {
  await AppTrackingTransparency.requestTrackingAuthorization();
}
