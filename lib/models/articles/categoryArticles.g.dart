// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryArticles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryArticles _$$_CategoryArticlesFromJson(Map<String, dynamic> json) =>
    _$_CategoryArticles(
      category: Category.fromJson(json['category']),
      articleList: (json['articleList'] as List<dynamic>)
          .map((e) => BlogArticle.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryArticlesToJson(_$_CategoryArticles instance) =>
    <String, dynamic>{
      'category': instance.category.toJson(),
      'articleList': instance.articleList.map((e) => e.toJson()).toList(),
    };
