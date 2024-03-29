import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/firebase_options.dart';
import 'package:guide_liverpool/features/guideHome/helpers/detailArticleBottomModal.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedVideos/featured_video_modal_sheet.dart';
import 'package:guide_liverpool/features/shared/widgets/bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              HomeTab(),
              NewsTab(),
              AccountTab(),
              NetworkTab(),
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
      if (remoteMessage.data.containsKey('postID')) {
        int articleID = int.parse(remoteMessage.data['postID']);

        newsService
            .getArticleByID(articleID)
            .then((BlogArticle article) => showModalBottomSheet(
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) =>
                      DetailArticleBottomModel(articleData: article),
                ));
      } else if (remoteMessage.data.containsKey('videoID')) {
        String videoID = remoteMessage.data['videoID'];

        peeplMediaService.getVideoById(videoID).then(
          (VideoArticle? video) {
            if (video != null) {
              showModalBottomSheet<Widget>(
                isScrollControlled: true,
                useRootNavigator: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) => FeaturedVideoModalSheet(video: video),
              );
            } else {
              showErrorSnack(
                context: context,
                title: 'Sorry this video could not be found',
                message: 'Please try again later',
              );
            }
          },
        );
      }
    }
  }
}

Future<void> requestAppTracking() async {
  await AppTrackingTransparency.requestTrackingAuthorization();
}
