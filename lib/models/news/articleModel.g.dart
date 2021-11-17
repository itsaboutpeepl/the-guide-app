// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleModel _$_$_ArticleModelFromJson(Map<String, dynamic> json) {
  return _$_ArticleModel(
    author: json['author'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    url: json['url'] as String?,
    urlToImage: json['urlToImage'] as String?,
    content: json['content'] as String?,
  );
}

Map<String, dynamic> _$_$_ArticleModelToJson(_$_ArticleModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
    };
