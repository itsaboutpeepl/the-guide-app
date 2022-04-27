// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoArticle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoArticle _$$_VideoArticleFromJson(Map<String, dynamic> json) =>
    _$_VideoArticle(
      title: json['title'] as String,
      placeholderImageURL: json['placeholderImageURL'] as String,
      videoURL: json['videoURL'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      rewardAmount: json['rewardAmount'] as int,
      postID: json['postID'] as String,
      postURL: json['postURL'] as String,
    );

Map<String, dynamic> _$$_VideoArticleToJson(_$_VideoArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'placeholderImageURL': instance.placeholderImageURL,
      'videoURL': instance.videoURL,
      'category': instance.category,
      'rewardAmount': instance.rewardAmount,
      'postID': instance.postID,
      'postURL': instance.postURL,
    };
