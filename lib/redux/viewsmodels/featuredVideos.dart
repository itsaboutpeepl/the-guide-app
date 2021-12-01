import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';
import 'package:redux/redux.dart';

class FeaturedVideosViewModel extends Equatable {
  final List<VideoArticle> featuredVideos;

  FeaturedVideosViewModel({required this.featuredVideos});

  static FeaturedVideosViewModel fromStore(Store<AppState> store) {
    return FeaturedVideosViewModel(
      featuredVideos: store.state.homePageState.featuredVideos,
    );
  }

  @override
  List<Object> get props => [featuredVideos];
}
