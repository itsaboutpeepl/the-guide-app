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
    categoryNames: (json['categoryNames'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    categoryArticles: (json['categoryArticles'] as List<dynamic>)
        .map((e) => CategoryArticles.fromJson(e))
        .toList(),
    featuredVideos: (json['featuredVideos'] as List<dynamic>)
        .map((e) => VideoArticle.fromJson(e))
        .toList(),
    eventList: (json['eventList'] as List<dynamic>)
        .map((e) => Events.fromJson(e))
        .toList(),
    directoryList: (json['directoryList'] as List<dynamic>)
        .map((e) => Directory.fromJson(e))
        .toList(),
  );
}

Map<String, dynamic> _$_$_NewsStateToJson(_$_NewsState instance) =>
    <String, dynamic>{
      'featuredPosts': instance.featuredPosts.map((e) => e.toJson()).toList(),
      'categoryNames': instance.categoryNames,
      'categoryArticles':
          instance.categoryArticles.map((e) => e.toJson()).toList(),
      'featuredVideos': instance.featuredVideos.map((e) => e.toJson()).toList(),
      'eventList': instance.eventList.map((e) => e.toJson()).toList(),
      'directoryList': instance.directoryList.map((e) => e.toJson()).toList(),
    };
