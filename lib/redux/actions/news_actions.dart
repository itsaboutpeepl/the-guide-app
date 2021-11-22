import 'package:peepl/models/articles/blogArticle.dart';
import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:peepl/models/articles/directory.dart';
import 'package:peepl/models/articles/events.dart';
import 'package:peepl/models/articles/videoArticle.dart';
import 'package:peepl/services.dart';
import 'package:peepl/utils/log/log.dart';
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

ThunkAction fetchFeaturedPost() {
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

ThunkAction fetchCategoryList() {
  return (Store store) async {
    try {
      List<Map> categoryNames = await newsService.categoryNames();
      List<CategoryArticles> categoryList = [];

      categoryNames.forEach(
        (element) async {
          categoryList.add(
            CategoryArticles(
              categoryID: element[0],
              categoryName: element[1],
              articleList: await newsService.articlesByCategoryID(
                element[0],
              ),
            ),
          );
        },
      );

      store.dispatch(UpdateCategoryList(categoryList: categoryList));
    } catch (e, s) {
      log.error('ERROR - fetchCategoryList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchCategoryList $e',
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
