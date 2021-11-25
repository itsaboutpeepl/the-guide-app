import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:peepl/models/home_page_state.dart';
import 'package:peepl/models/news_state.dart';
import 'package:peepl/redux/actions/news_actions.dart';
import 'package:redux/redux.dart';

final NewsStateReducers = combineReducers<NewsState>(
  [
    TypedReducer<NewsState, UpdateCategoryList>(_getCategoryList),
    TypedReducer<NewsState, UpdateCategoryNames>(_getCategoryNames),
    TypedReducer<NewsState, UpdateCurrentTabList>(_getCurrentTabList),
    TypedReducer<NewsState, UpdateCurrentTabIndex>(_updateCurrentTabIndex),
  ],
);

NewsState _getCategoryNames(
  NewsState state,
  UpdateCategoryNames action,
) {
  return state.copyWith(categoryNames: action.categoryNames);
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

NewsState _updateCurrentTabIndex(
    NewsState state, UpdateCurrentTabIndex action) {
  return state.copyWith(currentTabIndex: action.currentTabIndex);
}
