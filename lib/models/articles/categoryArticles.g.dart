// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryArticles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryArticles _$_$_CategoryArticlesFromJson(Map<String, dynamic> json) {
  return _$_CategoryArticles(
    categoryID: json['categoryID'] as String,
    categoryName: json['categoryName'] as String,
    articleList: (json['articleList'] as List<dynamic>)
        .map((e) => BlogArticle.fromJson(e))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CategoryArticlesToJson(
        _$_CategoryArticles instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'categoryName': instance.categoryName,
      'articleList': instance.articleList.map((e) => e.toJson()).toList(),
    };
