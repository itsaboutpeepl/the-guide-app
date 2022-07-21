// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vesting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VestingState _$$_VestingStateFromJson(Map<String, dynamic> json) =>
    _$_VestingState(
      scheduleID: json['scheduleID'] as String?,
      vestedAmount: json['vestedAmount'] as String?,
      fullyVestedDays: json['fullyVestedDays'] as String?,
      fullyVestedDateTime: json['fullyVestedDateTime'] as String?,
      withdrawableAmount: json['withdrawableAmount'] as String?,
      cliffEndDays: json['cliffEndDays'] as String?,
      cliffDateTime: json['cliffDateTime'] as String?,
      isRevoked: json['isRevoked'] as bool?,
    );

Map<String, dynamic> _$$_VestingStateToJson(_$_VestingState instance) =>
    <String, dynamic>{
      'scheduleID': instance.scheduleID,
      'vestedAmount': instance.vestedAmount,
      'fullyVestedDays': instance.fullyVestedDays,
      'fullyVestedDateTime': instance.fullyVestedDateTime,
      'withdrawableAmount': instance.withdrawableAmount,
      'cliffEndDays': instance.cliffEndDays,
      'cliffDateTime': instance.cliffDateTime,
      'isRevoked': instance.isRevoked,
    };
