import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/models/schedules/schedules.dart';

part 'vesting_state.freezed.dart';
part 'vesting_state.g.dart';

@freezed
class VestingState with _$VestingState {
  const VestingState._();

  @JsonSerializable()
  factory VestingState({
    @JsonKey(ignore: true) @Default([]) List<Schedules> vestingSchedule,
    @JsonKey(ignore: true) @Default([]) List<dynamic> scheduleIDs,
    @JsonKey(ignore: true) @Default(false) bool hasVestingSchedule,
    @JsonKey(ignore: true) @Default(null) Decimal? currentAmountReleasable,
    @JsonKey(ignore: true) @Default(null) DateTime? scheduleEnd,
    @JsonKey(ignore: true) @Default(null) DateTime? scheduleStart,
    @JsonKey(ignore: true) @Default("") String? displayScheduleID,
    @JsonKey(ignore: true) @Default(null) BigInt? scheduleCount,
    @JsonKey(ignore: true) @Default(false) bool isContractFullyVested,
    @JsonKey(ignore: true) @Default(null) BigInt? withdrawableAmount,
    @JsonKey(ignore: true) @Default(0) int cliffEndDays,
    @JsonKey(ignore: true) @Default(0) int endTimeDays,
    @JsonKey(ignore: true) @Default(false) bool vestedChecker,
    @JsonKey(ignore: true) @Default(false) bool isLoading,
    @JsonKey(ignore: true) @Default(false) bool isRevoked,
    @JsonKey(ignore: true) @Default(null) DateTime? cliff,
    @JsonKey(ignore: true) @Default(null) Decimal? vestedTotal,
  }) = _VestingState;

  factory VestingState.initial() => VestingState(
        vestingSchedule: [],
        scheduleIDs: [],
        hasVestingSchedule: false,
        currentAmountReleasable: Decimal.zero,
        scheduleEnd: null,
        scheduleStart: null,
        displayScheduleID: 'No Vesting Schedule Found',
        scheduleCount: BigInt.zero,
        isContractFullyVested: false,
        withdrawableAmount: BigInt.zero,
        cliffEndDays: 0,
        endTimeDays: 0,
        vestedChecker: false,
        isLoading: false,
        isRevoked: false,
        cliff: null,
        vestedTotal: null,
      );

  factory VestingState.fromJson(dynamic json) => _$VestingStateFromJson(json);
}

class VestingStateConverter implements JsonConverter<VestingState, Map<String, dynamic>?> {
  const VestingStateConverter();

  @override
  VestingState fromJson(Map<String, dynamic>? json) => VestingState.initial();

  @override
  Map<String, dynamic> toJson(VestingState instance) => instance.toJson();
}
