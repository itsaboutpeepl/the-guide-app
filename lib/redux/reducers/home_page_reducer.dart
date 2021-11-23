import 'package:peepl/models/home_page_state.dart';
import 'package:peepl/redux/actions/home_page_actions.dart';
import 'package:redux/redux.dart';

final HomePageReducers = combineReducers<HomePageState>(
  [
    TypedReducer<HomePageState, UpdateFeaturedPost>(_getFeaturedPosts),
    // TypedReducer<HomePageState, UpdateCategoryList>(_getCategoryList),
    TypedReducer<HomePageState, UpdateFeaturedVideos>(_getFeaturedVideos),
    TypedReducer<HomePageState, UpdateEventsList>(_getEventsList),
    TypedReducer<HomePageState, UpdateDirectoryList>(_getDirectoryList),
  ],
);

HomePageState _getFeaturedPosts(
  HomePageState state,
  UpdateFeaturedPost action,
) {
  return state.copyWith(featuredPosts: action.listOfFeaturedArticles);
}

// HomePageState _getCategoryList(
//   HomePageState state,
//   UpdateCategoryList action,
// ) {
//   return state.copyWith(categoryArticles: action.categoryList);
// }

HomePageState _getFeaturedVideos(
    HomePageState state, UpdateFeaturedVideos action) {
  return state.copyWith(featuredVideos: action.featuredVideos);
}

HomePageState _getEventsList(HomePageState state, UpdateEventsList action) {
  return state.copyWith(eventList: action.eventsList);
}

HomePageState _getDirectoryList(
    HomePageState state, UpdateDirectoryList action) {
  return state.copyWith(directoryList: action.directoryList);
}
