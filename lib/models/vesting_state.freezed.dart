// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vesting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VestingState _$VestingStateFromJson(Map<String, dynamic> json) {
  return _VestingState.fromJson(json);
}

/// @nodoc
mixin _$VestingState {
  String get scheduleID => throw _privateConstructorUsedError;
  List<Schedules> get schedule => throw _privateConstructorUsedError;
  String get withdrawableAmount => throw _privateConstructorUsedError;
  bool get isRevoked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VestingStateCopyWith<VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VestingStateCopyWith<$Res> {
  factory $VestingStateCopyWith(
          VestingState value, $Res Function(VestingState) then) =
      _$VestingStateCopyWithImpl<$Res>;
  $Res call(
      {String scheduleID,
      List<Schedules> schedule,
      String withdrawableAmount,
      bool isRevoked});
}

/// @nodoc
class _$VestingStateCopyWithImpl<$Res> implements $VestingStateCopyWith<$Res> {
  _$VestingStateCopyWithImpl(this._value, this._then);

  final VestingState _value;
  // ignore: unused_field
  final $Res Function(VestingState) _then;

  @override
  $Res call({
    Object? scheduleID = freezed,
    Object? schedule = freezed,
    Object? withdrawableAmount = freezed,
    Object? isRevoked = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleID: scheduleID == freezed
          ? _value.scheduleID
          : scheduleID // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      withdrawableAmount: withdrawableAmount == freezed
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isRevoked: isRevoked == freezed
          ? _value.isRevoked
          : isRevoked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_VestingStateCopyWith<$Res>
    implements $VestingStateCopyWith<$Res> {
  factory _$$_VestingStateCopyWith(
          _$_VestingState value, $Res Function(_$_VestingState) then) =
      __$$_VestingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String scheduleID,
      List<Schedules> schedule,
      String withdrawableAmount,
      bool isRevoked});
}

/// @nodoc
class __$$_VestingStateCopyWithImpl<$Res>
    extends _$VestingStateCopyWithImpl<$Res>
    implements _$$_VestingStateCopyWith<$Res> {
  __$$_VestingStateCopyWithImpl(
      _$_VestingState _value, $Res Function(_$_VestingState) _then)
      : super(_value, (v) => _then(v as _$_VestingState));

  @override
  _$_VestingState get _value => super._value as _$_VestingState;

  @override
  $Res call({
    Object? scheduleID = freezed,
    Object? schedule = freezed,
    Object? withdrawableAmount = freezed,
    Object? isRevoked = freezed,
  }) {
    return _then(_$_VestingState(
      scheduleID: scheduleID == freezed
          ? _value.scheduleID
          : scheduleID // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: schedule == freezed
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      withdrawableAmount: withdrawableAmount == freezed
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isRevoked: isRevoked == freezed
          ? _value.isRevoked
          : isRevoked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VestingState extends _VestingState {
  _$_VestingState(
      {required this.scheduleID,
      required final List<Schedules> schedule,
      required this.withdrawableAmount,
      required this.isRevoked})
      : _schedule = schedule,
        super._();

  factory _$_VestingState.fromJson(Map<String, dynamic> json) =>
      _$$_VestingStateFromJson(json);

  @override
  final String scheduleID;
  final List<Schedules> _schedule;
  @override
  List<Schedules> get schedule {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  final String withdrawableAmount;
  @override
  final bool isRevoked;

  @override
  String toString() {
    return 'VestingState(scheduleID: $scheduleID, schedule: $schedule, withdrawableAmount: $withdrawableAmount, isRevoked: $isRevoked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VestingState &&
            const DeepCollectionEquality()
                .equals(other.scheduleID, scheduleID) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            const DeepCollectionEquality()
                .equals(other.withdrawableAmount, withdrawableAmount) &&
            const DeepCollectionEquality().equals(other.isRevoked, isRevoked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scheduleID),
      const DeepCollectionEquality().hash(_schedule),
      const DeepCollectionEquality().hash(withdrawableAmount),
      const DeepCollectionEquality().hash(isRevoked));

  @JsonKey(ignore: true)
  @override
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      __$$_VestingStateCopyWithImpl<_$_VestingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VestingStateToJson(this);
  }
}

abstract class _VestingState extends VestingState {
  factory _VestingState(
      {required final String scheduleID,
      required final List<Schedules> schedule,
      required final String withdrawableAmount,
      required final bool isRevoked}) = _$_VestingState;
  _VestingState._() : super._();

  factory _VestingState.fromJson(Map<String, dynamic> json) =
      _$_VestingState.fromJson;

  @override
  String get scheduleID => throw _privateConstructorUsedError;
  @override
  List<Schedules> get schedule => throw _privateConstructorUsedError;
  @override
  String get withdrawableAmount => throw _privateConstructorUsedError;
  @override
  bool get isRevoked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}
