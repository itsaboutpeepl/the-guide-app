import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:guide_liverpool/models/articles/categoryArticles.dart';
import 'package:guide_liverpool/models/articles/directory.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateFeaturedPost {
  final List<BlogArticle> listOfFeaturedArticles;

  UpdateFeaturedPost({required this.listOfFeaturedArticles});
}

class UpdateCategoryList {
  final List<CategoryArticles> categoryList;

  UpdateCategoryList({required this.categoryList});
}

class UpdateFeaturedVideos {
  final List<VideoArticle> featuredVideos;

  UpdateFeaturedVideos({required this.featuredVideos});
}

class UpdateEventsList {
  final List<Events> eventsList;

  UpdateEventsList({required this.eventsList});
}

class UpdateDirectoryList {
  final List<Directory> directoryList;

  UpdateDirectoryList({required this.directoryList});
}

class UpdatePlayConfetti {
  final bool playConfetti;
  UpdatePlayConfetti({required this.playConfetti});
}

class UpdateIsLoading {
  final bool isLoading;
  UpdateIsLoading({required this.isLoading});
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
      List<VideoArticle> videoArticles = await newsService.featuredVideos();
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
      List<Events> eventsList = await newsService.eventsList();
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
      store.dispatch(UpdateIsLoading(isLoading: false));
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
      store.dispatch(fetchFeaturedPosts());
      store.dispatch(fetchFeaturedVideos());
      store.dispatch(fetchEventsList());
      store.dispatch(fetchDirectoryList());
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
