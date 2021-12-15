import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/models/articles/category.dart';
import 'package:guide_liverpool/models/articles/categoryArticles.dart';

part 'news_state.freezed.dart';
part 'news_state.g.dart';

@freezed
class NewsState with _$NewsState {
  const NewsState._();

  @JsonSerializable()
  factory NewsState({
    required List<Category> categories,
    required List<CategoryArticles> articles,
    required int currentTabIndex,
  }) = _NewsState;

  factory NewsState.initial() => NewsState(
        categories: [],
        articles: [],
        currentTabIndex: 0,
      );

  factory NewsState.fromJson(dynamic json) => _$NewsStateFromJson(json);
}

class NewsStateConverter
    implements JsonConverter<NewsState, Map<String, dynamic>?> {
  const NewsStateConverter();

  @override
  NewsState fromJson(Map<String, dynamic>? json) =>
      json != null ? NewsState.fromJson(json) : NewsState.initial();

  @override
  Map<String, dynamic> toJson(NewsState instance) => instance.toJson();
}
