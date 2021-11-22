import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/videoArticle.dart';
import 'package:redux/redux.dart';

class FeaturedVideosViewModel extends Equatable {
  final List<VideoArticle> featuredVideos;

  FeaturedVideosViewModel({required this.featuredVideos});

  static FeaturedVideosViewModel fromStore(Store<AppState> store) {
    return FeaturedVideosViewModel(
      featuredVideos: store.state.newsState.featuredVideos,
    );
  }

  @override
  List<Object> get props => [featuredVideos];
}
