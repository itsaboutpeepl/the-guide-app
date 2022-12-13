import 'package:flutter/material.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:guide_liverpool/models/articles/categoryArticles.dart';
import 'package:guide_liverpool/models/articles/directory.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:guide_liverpool/redux/actions/news_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateFeaturedPost {
  final List<BlogArticle> listOfFeaturedArticles;

  UpdateFeaturedPost({required this.listOfFeaturedArticles});

  @override
  String toString() =>
      'UpdateFeaturedPost : listOfFeaturedArticles: $listOfFeaturedArticles';
}

class UpdateCategoryList {
  final List<CategoryArticles> categoryList;

  UpdateCategoryList({required this.categoryList});

  @override
  String toString() => 'UpdateCategoryList : categoryList: $categoryList';
}

class UpdateFeaturedVideos {
  final List<VideoArticle> featuredVideos;

  UpdateFeaturedVideos({required this.featuredVideos});

  @override
  String toString() => 'UpdateFeaturedVideos : featuredVideos: $featuredVideos';
}

class UpdateEventsList {
  final List<Events> eventsList;

  UpdateEventsList({required this.eventsList});

  @override
  String toString() => 'UpdateEventsList : eventsList: $eventsList';
}

class UpdateDirectoryList {
  final List<Directory> directoryList;

  UpdateDirectoryList({required this.directoryList});

  @override
  String toString() => 'UpdateDirectoryList : directoryList: $directoryList';
}

class UpdatePlayConfetti {
  final bool playConfetti;
  UpdatePlayConfetti({required this.playConfetti});

  @override
  String toString() => 'UpdatePlayConfetti : playConfetti: $playConfetti';
}

class UpdateIsLoading {
  final bool isLoading;
  UpdateIsLoading({required this.isLoading});

  @override
  String toString() => 'UpdateIsLoading : isLoading: $isLoading';
}

ThunkAction fetchFeaturedPosts() {
  return (Store store) async {
    try {
      List<BlogArticle> articles = await newsService.featuredArticles();

      store.dispatch(UpdateFeaturedPost(listOfFeaturedArticles: articles));
    } catch (e, s) {
      log.error('ERROR - fetchFeaturedPost $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchFeaturedPost $e',
      );
    }
  };
}

ThunkAction fetchFeaturedVideos() {
  return (Store store) async {
    try {
      //await peeplMediaService.loginToDashboard();
      List<VideoArticle> videoArticles =
          await peeplMediaService.featuredVideos();
      store.dispatch(UpdateFeaturedVideos(featuredVideos: videoArticles));
    } catch (e, s) {
      log.error('ERROR - fetchFeaturedVideos $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchFeaturedVideos $e',
      );
    }
  };
}

ThunkAction fetchEventsList() {
  return (Store store) async {
    try {
      List<Events> eventsList = await newsService.eventsList(page: 1);
      eventsList.addAll(await newsService.eventsList(page: 2));
      store.dispatch(UpdateEventsList(eventsList: eventsList));
    } catch (e, s) {
      log.error('ERROR - fetchEventsList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchEventsList $e',
      );
    }
  };
}

ThunkAction fetchDirectoryList() {
  return (Store store) async {
    try {
      List<Directory> directoryList = await newsService.directoryList();
      store.dispatch(UpdateDirectoryList(directoryList: directoryList));
      Future.delayed(Duration(seconds: 2),
          () => store.dispatch(UpdateIsLoading(isLoading: false)));
    } catch (e, s) {
      log.error('ERROR - fetchDirectoryList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchDirectoryList $e',
      );
    }
  };
}

ThunkAction fetchHomePageData() {
  return (Store store) async {
    try {
      store.dispatch(UpdateIsLoading(isLoading: true));
      store.dispatch(fetchFeaturedPosts());
      store.dispatch(fetchFeaturedVideos());
      store.dispatch(fetchEventsList());
      store.dispatch(fetchDirectoryList());
      store.dispatch(fetchCategoryNames());
    } catch (e, s) {
      log.error('ERROR - fetchHomePageData $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchHomePageData $e',
      );
    }
  };
}

ThunkAction<AppState> createVideoView(
  String videoID,
  void Function(int rewardAmount) successCallback,
  void Function() errorCallback,
) {
  return (Store<AppState> store) async {
    try {
      int rewardsIssued = await peeplMediaService.createVideoView(
        videoID,
        store.state.userState.walletAddress,
      );

      if (rewardsIssued > 0) {
        successCallback(rewardsIssued);
        Future.delayed(const Duration(seconds: 2), () {
          pplToken.fetchBalance(
            store.state.userState.walletAddress,
            onDone: (balance) {
              if (balance.compareTo(pplToken.amount) != 0) {
                store.dispatch(
                  GetTokenBalanceSuccess(
                    tokenBalance: balance,
                    tokenAddress: pplToken.address,
                  ),
                );
              }
            },
            onError: (
              Object e,
              StackTrace s,
            ) {
              log.error(
                'Error - createVideoView fetchBalance ${pplToken.name}',
                error: e,
                stackTrace: s,
              );
            },
          );
        });
      }
    } catch (e, s) {
      errorCallback();
      log.error('ERROR - createVideoView $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - createVideoView $e',
      );
    }
  };
}
