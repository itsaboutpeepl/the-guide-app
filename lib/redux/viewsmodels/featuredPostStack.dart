import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:redux/redux.dart';

class FeaturedPostStackViewModel extends Equatable {
  final List<BlogArticle> featuredArticles;

  FeaturedPostStackViewModel({required this.featuredArticles});

  static FeaturedPostStackViewModel fromStore(Store<AppState> store) {
    return FeaturedPostStackViewModel(
      featuredArticles: store.state.homePageState.featuredPosts,
    );
  }

  @override
  List<Object> get props => [featuredArticles];
}
