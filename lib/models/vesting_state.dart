import 'package:freezed_annotation/freezed_annotation.dart';

part 'vesting_state.freezed.dart';
part 'vesting_state.g.dart';

@freezed
class VestingState with _$VestingState {
  const VestingState._();

  @JsonSerializable()
  factory VestingState({
    final String? scheduleID,
    final String? vestedAmount,
    final String? fullyVestedDays,
    final String? fullyVestedDateTime,
    final String? withdrawableAmount,
    final String? cliffEndDays,
    final String? cliffDateTime,
    final bool? isRevoked,
  }) = _VestingState;

  factory VestingState.initial() => VestingState(
        scheduleID: 'No Vesting Schedule Found',
        vestedAmount: '##### PPL (£####)',
        fullyVestedDays: '##### Days',
        fullyVestedDateTime: 'YYYY-MM-DD',
        withdrawableAmount: '##### PPL (£####)',
        cliffEndDays: '##### Days',
        cliffDateTime: 'YYYY-MM-DD',
        isRevoked: false,
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
