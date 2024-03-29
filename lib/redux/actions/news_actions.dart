import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:guide_liverpool/models/articles/category.dart';
import 'package:guide_liverpool/models/articles/categoryArticles.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateCategoryList {
  final List<CategoryArticles> categoryList;

  UpdateCategoryList({required this.categoryList});
}

class UpdateCategories {
  final List<Category> categories;

  UpdateCategories({required this.categories});
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

class RefreshCurrentTabList {
  final List<BlogArticle> articleList;
  final int currentTabIndex;

  RefreshCurrentTabList(
      {required this.articleList, required this.currentTabIndex});
}

class UpdateNewsIsLoading {
  final bool isLoading;
  UpdateNewsIsLoading({required this.isLoading});
}

ThunkAction<AppState> fetchCategoryNames() {
  return (Store<AppState> store) async {
    try {
      List<Category> categories = await newsService.getCategories();
      List<CategoryArticles> categoryArticles = [];

      categories.forEach(
        (element) {
          categoryArticles.add(
            CategoryArticles(
              category: element,
              articleList: [],
            ),
          );
        },
      );

      store.dispatch(UpdateCategories(categories: categories));
      store.dispatch(UpdateCategoryList(categoryList: categoryArticles));
    } catch (e, s) {
      log.error('ERROR - fetchCategoryNames $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap({'error': 'ERROR - fetchCategoryNames $e'}),
      );
    }
  };
}

ThunkAction<AppState> refreshCurrentTabList({int page = 0, String query = ""}) {
  return (Store<AppState> store) async {
    try {
      List<BlogArticle> newListOfArticles =
          await newsService.pagedArticlesByCategoryID(query);

      store.dispatch(RefreshCurrentTabList(
          articleList: newListOfArticles,
          currentTabIndex: store.state.newsState.currentTabIndex));
    } catch (e, s) {
      log.error('ERROR - updateCurrentTabList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap({'error': 'ERROR - updateCurrentTabList $e'}),
      );
    }
  };
}

ThunkAction<AppState> updateCurrentTabList({int page = 1, String query = ""}) {
  return (Store<AppState> store) async {
    try {
      List<BlogArticle> newListOfArticles =
          await newsService.pagedArticlesByCategoryID(query, page: page);

      store.dispatch(UpdateCurrentTabList(
          articleList: newListOfArticles,
          currentTabIndex: store.state.newsState.currentTabIndex));
      store.dispatch(UpdateNewsIsLoading(isLoading: false));
    } catch (e, s) {
      log.error('ERROR - updateCurrentTabList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap({'error': 'ERROR - updateCurrentTabList $e'}),
      );
    }
  };
}

ThunkAction<AppState> updateEventList({int page = 1}) {
  return (Store<AppState> store) async {
    try {
      List<Events> eventsList = await newsService.eventsList(page: page);
      store.dispatch(UpdateEventsList(eventsList: eventsList));
    } catch (e, s) {
      log.error('ERROR - updateCurrentTabList $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap({'error': 'ERROR - updateCurrentTabList $e'}),
      );
    }
  };
}

ThunkAction<AppState> fetchNewsScreenData() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(UpdateCurrentTabIndex(currentTabIndex: 0));
      store.dispatch(fetchCategoryNames());
      // store.dispatch(
      //   updateCurrentTabList(
      //     query: store.state.newsState.categories[0].categoryID.toString(),
      //   ),
      // );
      store.dispatch(UpdateNewsIsLoading(isLoading: false));
    } catch (e, s) {
      log.error('ERROR - fetchNewsScreenData $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap({'error': 'ERROR - fetchNewsScreenData $e'}),
      );
    }
  };
}
