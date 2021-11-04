import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:redux/redux.dart';

class FeaturedPostViewModel extends Equatable {
  final BlogArticle blogArticle;

  FeaturedPostViewModel({required this.blogArticle});

  static FeaturedPostViewModel fromStore(Store<AppState> store) {
    return FeaturedPostViewModel(
      blogArticle: store.state.newsState.featuredPost,
    );
  }

  @override
  List<Object> get props => [blogArticle];
}
