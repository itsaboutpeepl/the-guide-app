import 'dart:math';

import 'package:peepl/models/articles/blogArticle.dart';
import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:peepl/services.dart';
import 'package:peepl/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateIsRefresh {
  final bool isRefreshing;

  UpdateIsRefresh({required this.isRefreshing});
}

class UpdateCategoryList {
  final List<CategoryArticles> categoryList;

  UpdateCategoryList({required this.categoryList});
}

class UpdateCategoryNames {
  final List<String> categoryNames;

  UpdateCategoryNames({required this.categoryNames});
}

class UpdateCurrentTabIndex {
  final int currentTabIndex;
  UpdateCurrentTabIndex({required this.currentTabIndex});
}

class UpdateCurrentTabList {
  final List<BlogArticle> articleList;
  final int currentTabIndex;

  UpdateCurrentTabList(
      {required this.articleList, required this.currentTabIndex});
}

ThunkAction fetchCategoryNames() {
  return (Store store) async {
    try {
      List<String> categoryNames = await newsService.categoryNames();
      List<CategoryArticles> categoryArticles = [];

      categoryNames.forEach(
        (element) {
          categoryArticles.add(
            CategoryArticles(
              categoryID: Random().nextInt(127371).toString(),
              categoryName: element,
              articleList: [],
            ),
          );
        },
      );

      store.dispatch(UpdateCategoryNames(categoryNames: categoryNames));
      store.dispatch(UpdateCategoryList(categoryList: categoryArticles));
    } catch (e, s) {
      log.error('ERROR - fetchCategoryNames $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchCategoryNames $e',
      );
    }
  };
}

// ThunkAction fetchCategoryList(String categoryName, {int page = 0}) {
//   return (Store store) async {
//     try {
//       List<BlogArticle> newListOfArticles =
//           await newsService.pagedArticlesByCategoryID("2313");

//       List<CategoryArticles> articles = store.state.newsState.articles;

//       articles
//           .firstWhere((element) => element.categoryName == categoryName)
//           .articleList
//           .addAll(newListOfArticles);

//       store.dispatch(UpdateCategoryList(categoryList: articles));
//       print("DONE CALLING NEW LISt");
//     } catch (e, s) {
//       log.error('ERROR - fetchCategoryList $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchCategoryList $e',
//       );
//     }
//   };
// }

ThunkAction updateCurrentTabList({int page = 0, String query = ""}) {
  return (Store store) async {
    try {
      List<BlogArticle> newListOfArticles =
          await newsService.pagedArticlesByCategoryID(query);

      // List<BlogArticle> oldListOfArticles = store.state.newsState
      //     .articles[store.state.newsState.currentTabIndex].articleList;

      // oldListOfArticles.addAll(newListOfArticles);

      store.dispatch(UpdateCurrentTabList(
          articleList: newListOfArticles,
          currentTabIndex: store.state.newsState.currentTabIndex));

      print("DONE CALLING NEW LISt");
    } catch (e, s) {
      log.error('ERROR - updateCurrentTabList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateCurrentTabList $e',
      );
    }
  };
}
