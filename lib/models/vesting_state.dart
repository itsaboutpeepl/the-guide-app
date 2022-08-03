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
    required List<Schedules> vestingSchedule,
    required List<dynamic> scheduleIDs,
    required bool hasVestingSchedule,
    required Decimal currentAmountReleasable,
    required DateTime? scheduleEnd,
    required DateTime? scheduleStart,
    required String? displayScheduleID,
    required BigInt scheduleCount,
    required bool isContractFullyVested,
    required BigInt withdrawableAmount,
    required int cliffEndDays,
    required int endTimeDays,
    required bool vestedChecker,
    required bool isLoading,
    required bool isRevoked,
    required DateTime? cliff,
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
      );

  factory VestingState.fromJson(dynamic json) => _$VestingStateFromJson(json);
}

class VestingStateConverter
    implements JsonConverter<VestingState, Map<String, dynamic>?> {
  const VestingStateConverter();

  @override
  VestingState fromJson(Map<String, dynamic>? json) => VestingState.initial();

  @override
  Map<String, dynamic> toJson(VestingState instance) => instance.toJson();
}
