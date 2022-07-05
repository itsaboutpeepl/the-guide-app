import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/FirebaseConfig.dart';
import 'package:guide_liverpool/features/guideHome/helpers/detailArticleBottomModal.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/bottom_bar.dart';
import 'package:guide_liverpool/features/shared/widgets/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

  void handleFirebaseConfig() {
    firebaseMessaging.requestPermission();
    firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true, sound: true);
  }

  @override
  void initState() {
    handleFirebaseConfig();
    firebaseMessaging.getToken().then((value) => print("FCM TOKEN HEREEE $value"));

    firebaseMessaging.getAPNSToken().then((value) => print("APNS TOKEN $value"));

    // Function handleFCM = (RemoteMessage? remoteMessage) {
    //   if (remoteMessage != null) {
    //     print("PRINTING REMOTE MESSAGE HELOOOOO");
    //     print("RMDATA ${remoteMessage.data}");
    //     print("RMNOTIF ${remoteMessage.notification}");
    //     print("RMFROM ${remoteMessage.from}");
    //   }
    // };

    // firebaseMessaging.getInitialMessage().then((RemoteMessage? remoteMessage) {
    //   handleFCM(remoteMessage);
    // });

    startFirebaseNotifs();
    super.initState();
  }

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
            AccountTab(),
            WebviewTab(),
          ],
          bottomNavigationBuilder: (_, TabsRouter tabs) {
            _tabsRouter = tabs;
            return BottomBar(tabs);
          },
        ),
      ),
    );
  }

  void startFirebaseNotifs() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) => handleFCM(remoteMessage));

    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) => handleFCM(remoteMessage));
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage remoteMessage) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);

    handleFCM(remoteMessage);
  }

  void handleFCM(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      int articleID = int.parse(remoteMessage.data['postID']);

      newsService.getArticleByID(articleID).then(
            (article) => showBarModalBottomSheet(
              useRootNavigator: true,
              backgroundColor: Colors.cyan,
              context: context,
              builder: (context) => DetailArticleBottomModel(articleData: article),
            ),
          );
    }
  }
}
