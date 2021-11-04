import 'package:peepl/models/news_state.dart';
import 'package:peepl/redux/actions/news_actions.dart';
import 'package:redux/redux.dart';

final newsReducers = combineReducers<NewsState>([
  TypedReducer<NewsState, UpdateFeaturedPost>(_getFeaturedPost),
]);

NewsState _getFeaturedPost(
  NewsState state,
  UpdateFeaturedPost action,
) {
  return state.copyWith(featuredPost: action.newArticle);
}
