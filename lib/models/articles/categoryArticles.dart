import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/models/articles/category.dart';

import 'blogArticle.dart';
part 'categoryArticles.freezed.dart';
part 'categoryArticles.g.dart';

@freezed
class CategoryArticles with _$CategoryArticles {
  const CategoryArticles._();

  @JsonSerializable()
  factory CategoryArticles({
    required Category category,
    required List<BlogArticle> articleList,
  }) = _CategoryArticles;

  factory CategoryArticles.fromJson(dynamic json) =>
      _$CategoryArticlesFromJson(json);
}
