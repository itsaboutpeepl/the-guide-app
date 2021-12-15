// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsState _$$_NewsStateFromJson(Map<String, dynamic> json) => _$_NewsState(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => CategoryArticles.fromJson(e))
          .toList(),
      currentTabIndex: json['currentTabIndex'] as int,
    );

Map<String, dynamic> _$$_NewsStateToJson(_$_NewsState instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'articles': instance.articles.map((e) => e.toJson()).toList(),
      'currentTabIndex': instance.currentTabIndex,
    };
