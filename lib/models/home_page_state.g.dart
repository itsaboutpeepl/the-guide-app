// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomePageState _$$_HomePageStateFromJson(Map<String, dynamic> json) =>
    _$_HomePageState(
      featuredPosts: (json['featuredPosts'] as List<dynamic>)
          .map((e) => BlogArticle.fromJson(e))
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
      playConfetti: json['playConfetti'] as bool,
      isLoading: json['isLoading'] as bool,
      isError: json['isError'] as bool,
    );

Map<String, dynamic> _$$_HomePageStateToJson(_$_HomePageState instance) =>
    <String, dynamic>{
      'featuredPosts': instance.featuredPosts.map((e) => e.toJson()).toList(),
      'featuredVideos': instance.featuredVideos.map((e) => e.toJson()).toList(),
      'eventList': instance.eventList.map((e) => e.toJson()).toList(),
      'directoryList': instance.directoryList.map((e) => e.toJson()).toList(),
      'playConfetti': instance.playConfetti,
      'isLoading': instance.isLoading,
      'isError': instance.isError,
    };
