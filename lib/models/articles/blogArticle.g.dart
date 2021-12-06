// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogArticle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogArticle _$_$_BlogArticleFromJson(Map<String, dynamic> json) {
  return _$_BlogArticle(
    title: json['title'] as String,
    imageURL: json['imageURL'] as String,
    category:
        (json['category'] as List<dynamic>).map((e) => e as String).toList(),
    postID: json['postID'] as int,
    postURL: json['postURL'] as String,
    content: json['content'] as String,
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    gallery:
        (json['gallery'] as List<dynamic>).map((e) => e as String).toList(),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_BlogArticleToJson(_$_BlogArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageURL': instance.imageURL,
      'category': instance.category,
      'postID': instance.postID,
      'postURL': instance.postURL,
      'content': instance.content,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'gallery': instance.gallery,
      'description': instance.description,
    };
