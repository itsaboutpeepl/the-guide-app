import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedPosts/featuredPost.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:redux/redux.dart';

class FeaturedPostStackViewModel extends Equatable {
  final List<BlogArticle> featuredArticles;
  final List<FeaturedPost> listOfFeaturedPosts;

  FeaturedPostStackViewModel({
    required this.featuredArticles,
    required this.listOfFeaturedPosts,
  });

  static FeaturedPostStackViewModel fromStore(Store<AppState> store) {
    List<FeaturedPost> tempList = [];

    store.state.homePageState.featuredPosts.forEach((element) {
      tempList.add(
        FeaturedPost(
          index: store.state.homePageState.featuredPosts.indexOf(element),
          listOfArticles: store.state.homePageState.featuredPosts,
        ),
      );
    });

    return FeaturedPostStackViewModel(
      featuredArticles: store.state.homePageState.featuredPosts,
      listOfFeaturedPosts: tempList,
    );
  }

  @override
  List<Object> get props => [featuredArticles];
}
