import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@immutable
@freezed
class Stats with _$Stats {
  @JsonSerializable()
  factory Stats({
    String? volume,
    String? price,
    int? timestamp,
    DateTime? date,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
