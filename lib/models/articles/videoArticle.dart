import 'package:freezed_annotation/freezed_annotation.dart';
part 'videoArticle.freezed.dart';
part 'videoArticle.g.dart';

@immutable
@freezed
class VideoArticle with _$VideoArticle {
  const VideoArticle._();

  @JsonSerializable()
  factory VideoArticle({
    required String title,
    required String placeholderImageURL,
    required String videoURL,
    required List<String> category,
    required int rewardAmount,
    required String postID,
    required String postURL,
  }) = _VideoArticle;

  factory VideoArticle.fromJson(dynamic json) => _$VideoArticleFromJson(json);
}
