// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Events _$_$_EventsFromJson(Map<String, dynamic> json) {
  return _$_Events(
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
    eventTitle: json['eventTitle'] as String,
    location: json['location'] as String,
    coordinates: json['coordinates'] as String,
    time: json['time'] as String,
  );
}

Map<String, dynamic> _$_$_EventsToJson(_$_Events instance) => <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'eventTitle': instance.eventTitle,
      'location': instance.location,
      'coordinates': instance.coordinates,
      'time': instance.time,
    };
