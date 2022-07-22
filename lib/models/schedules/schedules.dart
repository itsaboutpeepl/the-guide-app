import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedules.freezed.dart';
part 'schedules.g.dart';

@freezed
class Schedules with _$Schedules {
  const Schedules._();

  @JsonSerializable()
  factory Schedules({
    final String? vestedAmount,
    final String? fullyVestedDays,
    final String? fullyVestedDateTime,
    final String? cliffEndDays,
    final String? cliffDateTime,
  }) = _Schedules;

  factory Schedules.fromJson(dynamic json) => _$SchedulesFromJson(json);
}
