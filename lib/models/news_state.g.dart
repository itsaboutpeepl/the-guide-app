// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsState _$_$_NewsStateFromJson(Map<String, dynamic> json) {
  return _$_NewsState(
    featuredPosts: (json['featuredPosts'] as List<dynamic>)
        .map((e) => BlogArticle.fromJson(e))
        .toList(),
    listOfRecommendedArticles:
        (json['listOfRecommendedArticles'] as List<dynamic>)
            .map((e) => BlogArticle.fromJson(e))
            .toList(),
    categoryNames: (json['categoryNames'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    categoryArticles: (json['categoryArticles'] as List<dynamic>)
        .map((e) => CategoryArticles.fromJson(e))
        .toList(),
    featuredVideos: (json['featuredVideos'] as List<dynamic>)
        .map((e) => VideoArticle.fromJson(e))
        .toList(),
  );
}

Map<String, dynamic> _$_$_NewsStateToJson(_$_NewsState instance) =>
    <String, dynamic>{
      'featuredPosts': instance.featuredPosts.map((e) => e.toJson()).toList(),
      'listOfRecommendedArticles':
          instance.listOfRecommendedArticles.map((e) => e.toJson()).toList(),
      'categoryNames': instance.categoryNames,
      'categoryArticles':
          instance.categoryArticles.map((e) => e.toJson()).toList(),
      'featuredVideos': instance.featuredVideos.map((e) => e.toJson()).toList(),
    };
