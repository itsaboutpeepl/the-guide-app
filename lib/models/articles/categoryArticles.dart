import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'blogArticle.dart';
part 'categoryArticles.freezed.dart';
part 'categoryArticles.g.dart';

@immutable
@freezed
class CategoryArticles with _$CategoryArticles {
  const CategoryArticles._();

  @JsonSerializable()
  factory CategoryArticles({
    required String categoryID,
    required String categoryName,
    required List<BlogArticle> articleList,
  }) = _CategoryArticles;

  factory CategoryArticles.fromJson(dynamic json) =>
      _$CategoryArticlesFromJson(json);
}
