import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/models/schedules/schedules.dart';

part 'vesting_state.freezed.dart';
part 'vesting_state.g.dart';

@freezed
class VestingState with _$VestingState {
  const VestingState._();

  @JsonSerializable()
  factory VestingState({
    required BigInt amount,
  }) = _VestingState;

  factory VestingState.initial() => VestingState(
        amount: BigInt.zero,
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
