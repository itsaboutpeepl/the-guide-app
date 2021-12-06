import 'package:guide_liverpool/models/news_state.dart';
import 'package:guide_liverpool/redux/actions/news_actions.dart';
import 'package:redux/redux.dart';

final NewsStateReducers = combineReducers<NewsState>(
  [
    TypedReducer<NewsState, UpdateCategoryList>(_getCategoryList),
    TypedReducer<NewsState, UpdateCategories>(_getCategories),
    TypedReducer<NewsState, UpdateCurrentTabList>(_getCurrentTabList),
    TypedReducer<NewsState, UpdateCurrentTabIndex>(_updateCurrentTabIndex),
    TypedReducer<NewsState, RefreshCurrentTabList>(_refreshCurrentTabList),
  ],
);

NewsState _getCategories(
  NewsState state,
  UpdateCategories action,
) {
  return state.copyWith(categories: action.categories);
}

NewsState _getCategoryList(
  NewsState state,
  UpdateCategoryList action,
) {
  return state.copyWith(articles: action.categoryList);
}

NewsState _getCurrentTabList(NewsState state, UpdateCurrentTabList action) {
  state.articles[action.currentTabIndex].articleList.addAll(action.articleList);

  return state.copyWith(
      currentTabIndex: action.currentTabIndex, articles: state.articles);
}

NewsState _refreshCurrentTabList(
    NewsState state, RefreshCurrentTabList action) {
  state.articles[action.currentTabIndex].articleList.clear();
  state.articles[action.currentTabIndex].articleList.addAll(action.articleList);
  return state.copyWith(
      currentTabIndex: action.currentTabIndex, articles: state.articles);
}

NewsState _updateCurrentTabIndex(
    NewsState state, UpdateCurrentTabIndex action) {
  return state.copyWith(currentTabIndex: action.currentTabIndex);
}
