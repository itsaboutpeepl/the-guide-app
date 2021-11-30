import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:peepl/models/articles/directory.dart';
import 'package:peepl/models/articles/events.dart';
import 'package:peepl/models/articles/videoArticle.dart';

part 'home_page_state.freezed.dart';
part 'home_page_state.g.dart';

@immutable
@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  @JsonSerializable()
  factory HomePageState(
      {required List<BlogArticle> featuredPosts,
      required List<VideoArticle> featuredVideos,
      required List<Events> eventList,
      required List<Directory> directoryList,
      required bool playConfetti}) = _HomePageState;

  factory HomePageState.initial() => HomePageState(
        featuredPosts: [],
        featuredVideos: [],
        eventList: [],
        directoryList: [],
        playConfetti: false,
      );

  factory HomePageState.fromJson(dynamic json) => _$HomePageStateFromJson(json);
}

class HomePageStateConverter
    implements JsonConverter<HomePageState, Map<String, dynamic>?> {
  const HomePageStateConverter();

  @override
  HomePageState fromJson(Map<String, dynamic>? json) =>
      json != null ? HomePageState.fromJson(json) : HomePageState.initial();

  @override
  Map<String, dynamic> toJson(HomePageState instance) => instance.toJson();
}
