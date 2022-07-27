// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vesting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VestingState _$$_VestingStateFromJson(Map<String, dynamic> json) =>
    _$_VestingState(
      vestingSchedule: (json['vestingSchedule'] as List<dynamic>)
          .map((e) => Schedules.fromJson(e))
          .toList(),
      scheduleIDs: (json['scheduleIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hasVestingSchedule: json['hasVestingSchedule'] as bool,
      currentAmountReleasable:
          Decimal.fromJson(json['currentAmountReleasable'] as String),
      scheduleStart: json['scheduleStart'] == null
          ? null
          : DateTime.parse(json['scheduleStart'] as String),
      displayScheduleID: json['displayScheduleID'] as String?,
      scheduleCount: json['scheduleCount'] as int,
      isContractFullyVested: json['isContractFullyVested'] as bool,
      withdrawableAmount: BigInt.parse(json['withdrawableAmount'] as String),
      cliffEndDays: json['cliffEndDays'] as int,
      endTimeDays: json['endTimeDays'] as int,
      vestedChecker: json['vestedChecker'] as bool,
      isLoading: json['isLoading'] as bool,
      isRevoked: json['isRevoked'] as bool,
    );

Map<String, dynamic> _$$_VestingStateToJson(_$_VestingState instance) =>
    <String, dynamic>{
      'vestingSchedule':
          instance.vestingSchedule.map((e) => e.toJson()).toList(),
      'scheduleIDs': instance.scheduleIDs,
      'hasVestingSchedule': instance.hasVestingSchedule,
      'currentAmountReleasable': instance.currentAmountReleasable.toJson(),
      'scheduleStart': instance.scheduleStart?.toIso8601String(),
      'displayScheduleID': instance.displayScheduleID,
      'scheduleCount': instance.scheduleCount,
      'isContractFullyVested': instance.isContractFullyVested,
      'withdrawableAmount': instance.withdrawableAmount.toString(),
      'cliffEndDays': instance.cliffEndDays,
      'endTimeDays': instance.endTimeDays,
      'vestedChecker': instance.vestedChecker,
      'isLoading': instance.isLoading,
      'isRevoked': instance.isRevoked,
    };
