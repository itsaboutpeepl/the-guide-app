import 'package:peepl/models/news_state.dart';
import 'package:peepl/redux/actions/news_actions.dart';
import 'package:redux/redux.dart';

final newsReducers = combineReducers<NewsState>(
  [
    TypedReducer<NewsState, UpdateFeaturedPost>(_getFeaturedPosts),
    TypedReducer<NewsState, UpdateCategoryList>(_getCategoryList),
    TypedReducer<NewsState, UpdateFeaturedVideos>(_getFeaturedVideos),
    TypedReducer<NewsState, UpdateEventsList>(_getEventsList),
    TypedReducer<NewsState, UpdateDirectoryList>(_getDirectoryList),
  ],
);

NewsState _getFeaturedPosts(
  NewsState state,
  UpdateFeaturedPost action,
) {
  return state.copyWith(featuredPosts: action.listOfFeaturedArticles);
}

NewsState _getCategoryList(
  NewsState state,
  UpdateCategoryList action,
) {
  return state.copyWith(categoryArticles: action.categoryList);
}

NewsState _getFeaturedVideos(NewsState state, UpdateFeaturedVideos action) {
  return state.copyWith(featuredVideos: action.featuredVideos);
}

NewsState _getEventsList(NewsState state, UpdateEventsList action) {
  return state.copyWith(eventList: action.eventsList);
}

NewsState _getDirectoryList(NewsState state, UpdateDirectoryList action) {
  return state.copyWith(directoryList: action.directoryList);
}
