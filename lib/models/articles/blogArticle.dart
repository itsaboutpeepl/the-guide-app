import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blogArticle.freezed.dart';
part 'blogArticle.g.dart';

@immutable
@freezed
class BlogArticle with _$BlogArticle {
  const BlogArticle._();

  @JsonSerializable()
  factory BlogArticle({
    required String title,
    required String imageURL,
    required List<String> category,
    required int postID,
    required String postURL,
  }) = _BlogArticle;

  factory BlogArticle.fromJson(dynamic json) => _$BlogArticleFromJson(json);
}
