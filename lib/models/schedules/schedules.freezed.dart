// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedules _$SchedulesFromJson(Map<String, dynamic> json) {
  return _Schedules.fromJson(json);
}

/// @nodoc
mixin _$Schedules {
  String? get vestedAmount => throw _privateConstructorUsedError;
  String? get fullyVestedDays => throw _privateConstructorUsedError;
  String? get fullyVestedDateTime => throw _privateConstructorUsedError;
  String? get cliffEndDays => throw _privateConstructorUsedError;
  String? get cliffDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchedulesCopyWith<Schedules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulesCopyWith<$Res> {
  factory $SchedulesCopyWith(Schedules value, $Res Function(Schedules) then) =
      _$SchedulesCopyWithImpl<$Res, Schedules>;
  @useResult
  $Res call(
      {String? vestedAmount,
      String? fullyVestedDays,
      String? fullyVestedDateTime,
      String? cliffEndDays,
      String? cliffDateTime});
}

/// @nodoc
class _$SchedulesCopyWithImpl<$Res, $Val extends Schedules>
    implements $SchedulesCopyWith<$Res> {
  _$SchedulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vestedAmount = freezed,
    Object? fullyVestedDays = freezed,
    Object? fullyVestedDateTime = freezed,
    Object? cliffEndDays = freezed,
    Object? cliffDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      vestedAmount: freezed == vestedAmount
          ? _value.vestedAmount
          : vestedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      fullyVestedDays: freezed == fullyVestedDays
          ? _value.fullyVestedDays
          : fullyVestedDays // ignore: cast_nullable_to_non_nullable
              as String?,
      fullyVestedDateTime: freezed == fullyVestedDateTime
          ? _value.fullyVestedDateTime
          : fullyVestedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      cliffEndDays: freezed == cliffEndDays
          ? _value.cliffEndDays
          : cliffEndDays // ignore: cast_nullable_to_non_nullable
              as String?,
      cliffDateTime: freezed == cliffDateTime
          ? _value.cliffDateTime
          : cliffDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchedulesCopyWith<$Res> implements $SchedulesCopyWith<$Res> {
  factory _$$_SchedulesCopyWith(
          _$_Schedules value, $Res Function(_$_Schedules) then) =
      __$$_SchedulesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? vestedAmount,
      String? fullyVestedDays,
      String? fullyVestedDateTime,
      String? cliffEndDays,
      String? cliffDateTime});
}

/// @nodoc
class __$$_SchedulesCopyWithImpl<$Res>
    extends _$SchedulesCopyWithImpl<$Res, _$_Schedules>
    implements _$$_SchedulesCopyWith<$Res> {
  __$$_SchedulesCopyWithImpl(
      _$_Schedules _value, $Res Function(_$_Schedules) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vestedAmount = freezed,
    Object? fullyVestedDays = freezed,
    Object? fullyVestedDateTime = freezed,
    Object? cliffEndDays = freezed,
    Object? cliffDateTime = freezed,
  }) {
    return _then(_$_Schedules(
      vestedAmount: freezed == vestedAmount
          ? _value.vestedAmount
          : vestedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      fullyVestedDays: freezed == fullyVestedDays
          ? _value.fullyVestedDays
          : fullyVestedDays // ignore: cast_nullable_to_non_nullable
              as String?,
      fullyVestedDateTime: freezed == fullyVestedDateTime
          ? _value.fullyVestedDateTime
          : fullyVestedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      cliffEndDays: freezed == cliffEndDays
          ? _value.cliffEndDays
          : cliffEndDays // ignore: cast_nullable_to_non_nullable
              as String?,
      cliffDateTime: freezed == cliffDateTime
          ? _value.cliffDateTime
          : cliffDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Schedules extends _Schedules {
  _$_Schedules(
      {this.vestedAmount,
      this.fullyVestedDays,
      this.fullyVestedDateTime,
      this.cliffEndDays,
      this.cliffDateTime})
      : super._();

  factory _$_Schedules.fromJson(Map<String, dynamic> json) =>
      _$$_SchedulesFromJson(json);

  @override
  final String? vestedAmount;
  @override
  final String? fullyVestedDays;
  @override
  final String? fullyVestedDateTime;
  @override
  final String? cliffEndDays;
  @override
  final String? cliffDateTime;

  @override
  String toString() {
    return 'Schedules(vestedAmount: $vestedAmount, fullyVestedDays: $fullyVestedDays, fullyVestedDateTime: $fullyVestedDateTime, cliffEndDays: $cliffEndDays, cliffDateTime: $cliffDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedules &&
            (identical(other.vestedAmount, vestedAmount) ||
                other.vestedAmount == vestedAmount) &&
            (identical(other.fullyVestedDays, fullyVestedDays) ||
                other.fullyVestedDays == fullyVestedDays) &&
            (identical(other.fullyVestedDateTime, fullyVestedDateTime) ||
                other.fullyVestedDateTime == fullyVestedDateTime) &&
            (identical(other.cliffEndDays, cliffEndDays) ||
                other.cliffEndDays == cliffEndDays) &&
            (identical(other.cliffDateTime, cliffDateTime) ||
                other.cliffDateTime == cliffDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vestedAmount, fullyVestedDays,
      fullyVestedDateTime, cliffEndDays, cliffDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchedulesCopyWith<_$_Schedules> get copyWith =>
      __$$_SchedulesCopyWithImpl<_$_Schedules>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchedulesToJson(
      this,
    );
  }
}

abstract class _Schedules extends Schedules {
  factory _Schedules(
      {final String? vestedAmount,
      final String? fullyVestedDays,
      final String? fullyVestedDateTime,
      final String? cliffEndDays,
      final String? cliffDateTime}) = _$_Schedules;
  _Schedules._() : super._();

  factory _Schedules.fromJson(Map<String, dynamic> json) =
      _$_Schedules.fromJson;

  @override
  String? get vestedAmount;
  @override
  String? get fullyVestedDays;
  @override
  String? get fullyVestedDateTime;
  @override
  String? get cliffEndDays;
  @override
  String? get cliffDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_SchedulesCopyWith<_$_Schedules> get copyWith =>
      throw _privateConstructorUsedError;
}
