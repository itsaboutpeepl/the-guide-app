import 'package:guide_liverpool/models/home_page_state.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:redux/redux.dart';

final HomePageReducers = combineReducers<HomePageState>(
  [
    TypedReducer<HomePageState, UpdateFeaturedPost>(_getFeaturedPosts),
    TypedReducer<HomePageState, UpdateFeaturedVideos>(_getFeaturedVideos),
    TypedReducer<HomePageState, UpdateEventsList>(_getEventsList),
    TypedReducer<HomePageState, UpdateDirectoryList>(_getDirectoryList),
    TypedReducer<HomePageState, UpdatePlayConfetti>(_getPlayConfetti),
    TypedReducer<HomePageState, UpdateIsLoading>(_updateIsLoading),
  ],
);

HomePageState _getFeaturedPosts(
  HomePageState state,
  UpdateFeaturedPost action,
) {
  return state.copyWith(featuredPosts: action.listOfFeaturedArticles);
}

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

HomePageState _getPlayConfetti(HomePageState state, UpdatePlayConfetti action) {
  return state.copyWith(playConfetti: action.playConfetti);
}

HomePageState _updateIsLoading(HomePageState state, UpdateIsLoading action) {
  return state.copyWith(isLoading: action.isLoading);
}
