// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Directory _$$_DirectoryFromJson(Map<String, dynamic> json) => _$_Directory(
      title: json['title'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      website: json['website'] as String,
      twitterLink: json['twitterLink'] as String,
      instaLink: json['instaLink'] as String,
      facebookLink: json['facebookLink'] as String,
      imageURL: json['imageURL'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      guideWebLink: json['guideWebLink'] as String,
    );

Map<String, dynamic> _$$_DirectoryToJson(_$_Directory instance) =>
    <String, dynamic>{
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'website': instance.website,
      'twitterLink': instance.twitterLink,
      'instaLink': instance.instaLink,
      'facebookLink': instance.facebookLink,
      'imageURL': instance.imageURL,
      'description': instance.description,
      'address': instance.address,
      'guideWebLink': instance.guideWebLink,
    };
