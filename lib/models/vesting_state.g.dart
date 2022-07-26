// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vesting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VestingState _$$_VestingStateFromJson(Map<String, dynamic> json) =>
    _$_VestingState(
      scheduleID: json['scheduleID'] as String,
      schedule: (json['schedule'] as List<dynamic>)
          .map((e) => Schedules.fromJson(e))
          .toList(),
      withdrawableAmount: json['withdrawableAmount'] as String,
      isRevoked: json['isRevoked'] as bool,
    );

Map<String, dynamic> _$$_VestingStateToJson(_$_VestingState instance) =>
    <String, dynamic>{
      'scheduleID': instance.scheduleID,
      'schedule': instance.schedule.map((e) => e.toJson()).toList(),
      'withdrawableAmount': instance.withdrawableAmount,
      'isRevoked': instance.isRevoked,
    };
