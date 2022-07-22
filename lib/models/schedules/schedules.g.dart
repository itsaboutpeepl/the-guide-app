// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedules _$$_SchedulesFromJson(Map<String, dynamic> json) => _$_Schedules(
      vestedAmount: json['vestedAmount'] as String?,
      fullyVestedDays: json['fullyVestedDays'] as String?,
      fullyVestedDateTime: json['fullyVestedDateTime'] as String?,
      cliffEndDays: json['cliffEndDays'] as String?,
      cliffDateTime: json['cliffDateTime'] as String?,
    );

Map<String, dynamic> _$$_SchedulesToJson(_$_Schedules instance) =>
    <String, dynamic>{
      'vestedAmount': instance.vestedAmount,
      'fullyVestedDays': instance.fullyVestedDays,
      'fullyVestedDateTime': instance.fullyVestedDateTime,
      'cliffEndDays': instance.cliffEndDays,
      'cliffDateTime': instance.cliffDateTime,
    };
