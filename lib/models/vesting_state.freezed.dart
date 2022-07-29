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
  List<Schedules> get vestingSchedule => throw _privateConstructorUsedError;
  List<String> get scheduleIDs => throw _privateConstructorUsedError;
  bool get hasVestingSchedule => throw _privateConstructorUsedError;
  Decimal get currentAmountReleasable => throw _privateConstructorUsedError;
  DateTime? get scheduleEnd => throw _privateConstructorUsedError;
  DateTime? get scheduleStart => throw _privateConstructorUsedError;
  String? get displayScheduleID => throw _privateConstructorUsedError;
  int get scheduleCount => throw _privateConstructorUsedError;
  bool get isContractFullyVested => throw _privateConstructorUsedError;
  BigInt get withdrawableAmount => throw _privateConstructorUsedError;
  int get cliffEndDays => throw _privateConstructorUsedError;
  int get endTimeDays => throw _privateConstructorUsedError;
  bool get vestedChecker => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRevoked => throw _privateConstructorUsedError;
  DateTime? get cliff => throw _privateConstructorUsedError;

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
      {List<Schedules> vestingSchedule,
      List<String> scheduleIDs,
      bool hasVestingSchedule,
      Decimal currentAmountReleasable,
      DateTime? scheduleEnd,
      DateTime? scheduleStart,
      String? displayScheduleID,
      int scheduleCount,
      bool isContractFullyVested,
      BigInt withdrawableAmount,
      int cliffEndDays,
      int endTimeDays,
      bool vestedChecker,
      bool isLoading,
      bool isRevoked,
      DateTime? cliff});
}

/// @nodoc
class _$VestingStateCopyWithImpl<$Res> implements $VestingStateCopyWith<$Res> {
  _$VestingStateCopyWithImpl(this._value, this._then);

  final VestingState _value;
  // ignore: unused_field
  final $Res Function(VestingState) _then;

  @override
  $Res call({
    Object? vestingSchedule = freezed,
    Object? scheduleIDs = freezed,
    Object? hasVestingSchedule = freezed,
    Object? currentAmountReleasable = freezed,
    Object? scheduleEnd = freezed,
    Object? scheduleStart = freezed,
    Object? displayScheduleID = freezed,
    Object? scheduleCount = freezed,
    Object? isContractFullyVested = freezed,
    Object? withdrawableAmount = freezed,
    Object? cliffEndDays = freezed,
    Object? endTimeDays = freezed,
    Object? vestedChecker = freezed,
    Object? isLoading = freezed,
    Object? isRevoked = freezed,
    Object? cliff = freezed,
  }) {
    return _then(_value.copyWith(
      vestingSchedule: vestingSchedule == freezed
          ? _value.vestingSchedule
          : vestingSchedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      scheduleIDs: scheduleIDs == freezed
          ? _value.scheduleIDs
          : scheduleIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasVestingSchedule: hasVestingSchedule == freezed
          ? _value.hasVestingSchedule
          : hasVestingSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      currentAmountReleasable: currentAmountReleasable == freezed
          ? _value.currentAmountReleasable
          : currentAmountReleasable // ignore: cast_nullable_to_non_nullable
              as Decimal,
      scheduleEnd: scheduleEnd == freezed
          ? _value.scheduleEnd
          : scheduleEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduleStart: scheduleStart == freezed
          ? _value.scheduleStart
          : scheduleStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      displayScheduleID: displayScheduleID == freezed
          ? _value.displayScheduleID
          : displayScheduleID // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleCount: scheduleCount == freezed
          ? _value.scheduleCount
          : scheduleCount // ignore: cast_nullable_to_non_nullable
              as int,
      isContractFullyVested: isContractFullyVested == freezed
          ? _value.isContractFullyVested
          : isContractFullyVested // ignore: cast_nullable_to_non_nullable
              as bool,
      withdrawableAmount: withdrawableAmount == freezed
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      cliffEndDays: cliffEndDays == freezed
          ? _value.cliffEndDays
          : cliffEndDays // ignore: cast_nullable_to_non_nullable
              as int,
      endTimeDays: endTimeDays == freezed
          ? _value.endTimeDays
          : endTimeDays // ignore: cast_nullable_to_non_nullable
              as int,
      vestedChecker: vestedChecker == freezed
          ? _value.vestedChecker
          : vestedChecker // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRevoked: isRevoked == freezed
          ? _value.isRevoked
          : isRevoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cliff: cliff == freezed
          ? _value.cliff
          : cliff // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {List<Schedules> vestingSchedule,
      List<String> scheduleIDs,
      bool hasVestingSchedule,
      Decimal currentAmountReleasable,
      DateTime? scheduleEnd,
      DateTime? scheduleStart,
      String? displayScheduleID,
      int scheduleCount,
      bool isContractFullyVested,
      BigInt withdrawableAmount,
      int cliffEndDays,
      int endTimeDays,
      bool vestedChecker,
      bool isLoading,
      bool isRevoked,
      DateTime? cliff});
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
    Object? vestingSchedule = freezed,
    Object? scheduleIDs = freezed,
    Object? hasVestingSchedule = freezed,
    Object? currentAmountReleasable = freezed,
    Object? scheduleEnd = freezed,
    Object? scheduleStart = freezed,
    Object? displayScheduleID = freezed,
    Object? scheduleCount = freezed,
    Object? isContractFullyVested = freezed,
    Object? withdrawableAmount = freezed,
    Object? cliffEndDays = freezed,
    Object? endTimeDays = freezed,
    Object? vestedChecker = freezed,
    Object? isLoading = freezed,
    Object? isRevoked = freezed,
    Object? cliff = freezed,
  }) {
    return _then(_$_VestingState(
      vestingSchedule: vestingSchedule == freezed
          ? _value._vestingSchedule
          : vestingSchedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      scheduleIDs: scheduleIDs == freezed
          ? _value._scheduleIDs
          : scheduleIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasVestingSchedule: hasVestingSchedule == freezed
          ? _value.hasVestingSchedule
          : hasVestingSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      currentAmountReleasable: currentAmountReleasable == freezed
          ? _value.currentAmountReleasable
          : currentAmountReleasable // ignore: cast_nullable_to_non_nullable
              as Decimal,
      scheduleEnd: scheduleEnd == freezed
          ? _value.scheduleEnd
          : scheduleEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduleStart: scheduleStart == freezed
          ? _value.scheduleStart
          : scheduleStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      displayScheduleID: displayScheduleID == freezed
          ? _value.displayScheduleID
          : displayScheduleID // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleCount: scheduleCount == freezed
          ? _value.scheduleCount
          : scheduleCount // ignore: cast_nullable_to_non_nullable
              as int,
      isContractFullyVested: isContractFullyVested == freezed
          ? _value.isContractFullyVested
          : isContractFullyVested // ignore: cast_nullable_to_non_nullable
              as bool,
      withdrawableAmount: withdrawableAmount == freezed
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      cliffEndDays: cliffEndDays == freezed
          ? _value.cliffEndDays
          : cliffEndDays // ignore: cast_nullable_to_non_nullable
              as int,
      endTimeDays: endTimeDays == freezed
          ? _value.endTimeDays
          : endTimeDays // ignore: cast_nullable_to_non_nullable
              as int,
      vestedChecker: vestedChecker == freezed
          ? _value.vestedChecker
          : vestedChecker // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRevoked: isRevoked == freezed
          ? _value.isRevoked
          : isRevoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cliff: cliff == freezed
          ? _value.cliff
          : cliff // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VestingState extends _VestingState {
  _$_VestingState(
      {required final List<Schedules> vestingSchedule,
      required final List<String> scheduleIDs,
      required this.hasVestingSchedule,
      required this.currentAmountReleasable,
      required this.scheduleEnd,
      required this.scheduleStart,
      required this.displayScheduleID,
      required this.scheduleCount,
      required this.isContractFullyVested,
      required this.withdrawableAmount,
      required this.cliffEndDays,
      required this.endTimeDays,
      required this.vestedChecker,
      required this.isLoading,
      required this.isRevoked,
      required this.cliff})
      : _vestingSchedule = vestingSchedule,
        _scheduleIDs = scheduleIDs,
        super._();

  factory _$_VestingState.fromJson(Map<String, dynamic> json) =>
      _$$_VestingStateFromJson(json);

  final List<Schedules> _vestingSchedule;
  @override
  List<Schedules> get vestingSchedule {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vestingSchedule);
  }

  final List<String> _scheduleIDs;
  @override
  List<String> get scheduleIDs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleIDs);
  }

  @override
  final bool hasVestingSchedule;
  @override
  final Decimal currentAmountReleasable;
  @override
  final DateTime? scheduleEnd;
  @override
  final DateTime? scheduleStart;
  @override
  final String? displayScheduleID;
  @override
  final int scheduleCount;
  @override
  final bool isContractFullyVested;
  @override
  final BigInt withdrawableAmount;
  @override
  final int cliffEndDays;
  @override
  final int endTimeDays;
  @override
  final bool vestedChecker;
  @override
  final bool isLoading;
  @override
  final bool isRevoked;
  @override
  final DateTime? cliff;

  @override
  String toString() {
    return 'VestingState(vestingSchedule: $vestingSchedule, scheduleIDs: $scheduleIDs, hasVestingSchedule: $hasVestingSchedule, currentAmountReleasable: $currentAmountReleasable, scheduleEnd: $scheduleEnd, scheduleStart: $scheduleStart, displayScheduleID: $displayScheduleID, scheduleCount: $scheduleCount, isContractFullyVested: $isContractFullyVested, withdrawableAmount: $withdrawableAmount, cliffEndDays: $cliffEndDays, endTimeDays: $endTimeDays, vestedChecker: $vestedChecker, isLoading: $isLoading, isRevoked: $isRevoked, cliff: $cliff)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VestingState &&
            const DeepCollectionEquality()
                .equals(other._vestingSchedule, _vestingSchedule) &&
            const DeepCollectionEquality()
                .equals(other._scheduleIDs, _scheduleIDs) &&
            const DeepCollectionEquality()
                .equals(other.hasVestingSchedule, hasVestingSchedule) &&
            const DeepCollectionEquality().equals(
                other.currentAmountReleasable, currentAmountReleasable) &&
            const DeepCollectionEquality()
                .equals(other.scheduleEnd, scheduleEnd) &&
            const DeepCollectionEquality()
                .equals(other.scheduleStart, scheduleStart) &&
            const DeepCollectionEquality()
                .equals(other.displayScheduleID, displayScheduleID) &&
            const DeepCollectionEquality()
                .equals(other.scheduleCount, scheduleCount) &&
            const DeepCollectionEquality()
                .equals(other.isContractFullyVested, isContractFullyVested) &&
            const DeepCollectionEquality()
                .equals(other.withdrawableAmount, withdrawableAmount) &&
            const DeepCollectionEquality()
                .equals(other.cliffEndDays, cliffEndDays) &&
            const DeepCollectionEquality()
                .equals(other.endTimeDays, endTimeDays) &&
            const DeepCollectionEquality()
                .equals(other.vestedChecker, vestedChecker) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isRevoked, isRevoked) &&
            const DeepCollectionEquality().equals(other.cliff, cliff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_vestingSchedule),
      const DeepCollectionEquality().hash(_scheduleIDs),
      const DeepCollectionEquality().hash(hasVestingSchedule),
      const DeepCollectionEquality().hash(currentAmountReleasable),
      const DeepCollectionEquality().hash(scheduleEnd),
      const DeepCollectionEquality().hash(scheduleStart),
      const DeepCollectionEquality().hash(displayScheduleID),
      const DeepCollectionEquality().hash(scheduleCount),
      const DeepCollectionEquality().hash(isContractFullyVested),
      const DeepCollectionEquality().hash(withdrawableAmount),
      const DeepCollectionEquality().hash(cliffEndDays),
      const DeepCollectionEquality().hash(endTimeDays),
      const DeepCollectionEquality().hash(vestedChecker),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isRevoked),
      const DeepCollectionEquality().hash(cliff));

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
      {required final List<Schedules> vestingSchedule,
      required final List<String> scheduleIDs,
      required final bool hasVestingSchedule,
      required final Decimal currentAmountReleasable,
      required final DateTime? scheduleEnd,
      required final DateTime? scheduleStart,
      required final String? displayScheduleID,
      required final int scheduleCount,
      required final bool isContractFullyVested,
      required final BigInt withdrawableAmount,
      required final int cliffEndDays,
      required final int endTimeDays,
      required final bool vestedChecker,
      required final bool isLoading,
      required final bool isRevoked,
      required final DateTime? cliff}) = _$_VestingState;
  _VestingState._() : super._();

  factory _VestingState.fromJson(Map<String, dynamic> json) =
      _$_VestingState.fromJson;

  @override
  List<Schedules> get vestingSchedule => throw _privateConstructorUsedError;
  @override
  List<String> get scheduleIDs => throw _privateConstructorUsedError;
  @override
  bool get hasVestingSchedule => throw _privateConstructorUsedError;
  @override
  Decimal get currentAmountReleasable => throw _privateConstructorUsedError;
  @override
  DateTime? get scheduleEnd => throw _privateConstructorUsedError;
  @override
  DateTime? get scheduleStart => throw _privateConstructorUsedError;
  @override
  String? get displayScheduleID => throw _privateConstructorUsedError;
  @override
  int get scheduleCount => throw _privateConstructorUsedError;
  @override
  bool get isContractFullyVested => throw _privateConstructorUsedError;
  @override
  BigInt get withdrawableAmount => throw _privateConstructorUsedError;
  @override
  int get cliffEndDays => throw _privateConstructorUsedError;
  @override
  int get endTimeDays => throw _privateConstructorUsedError;
  @override
  bool get vestedChecker => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isRevoked => throw _privateConstructorUsedError;
  @override
  DateTime? get cliff => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}
