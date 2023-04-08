// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(ignore: true)
  List<Schedules> get vestingSchedule => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<dynamic> get scheduleIDs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get hasVestingSchedule => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Decimal? get currentAmountReleasable => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DateTime? get scheduleEnd => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DateTime? get scheduleStart => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get displayScheduleID => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  BigInt? get scheduleCount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isContractFullyVested => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  BigInt? get withdrawableAmount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cliffEndDays => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get endTimeDays => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get vestedChecker => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isRevoked => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DateTime? get cliff => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Decimal? get vestedTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VestingStateCopyWith<VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VestingStateCopyWith<$Res> {
  factory $VestingStateCopyWith(
          VestingState value, $Res Function(VestingState) then) =
      _$VestingStateCopyWithImpl<$Res, VestingState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<Schedules> vestingSchedule,
      @JsonKey(ignore: true) List<dynamic> scheduleIDs,
      @JsonKey(ignore: true) bool hasVestingSchedule,
      @JsonKey(ignore: true) Decimal? currentAmountReleasable,
      @JsonKey(ignore: true) DateTime? scheduleEnd,
      @JsonKey(ignore: true) DateTime? scheduleStart,
      @JsonKey(ignore: true) String? displayScheduleID,
      @JsonKey(ignore: true) BigInt? scheduleCount,
      @JsonKey(ignore: true) bool isContractFullyVested,
      @JsonKey(ignore: true) BigInt? withdrawableAmount,
      @JsonKey(ignore: true) int cliffEndDays,
      @JsonKey(ignore: true) int endTimeDays,
      @JsonKey(ignore: true) bool vestedChecker,
      @JsonKey(ignore: true) bool isLoading,
      @JsonKey(ignore: true) bool isRevoked,
      @JsonKey(ignore: true) DateTime? cliff,
      @JsonKey(ignore: true) Decimal? vestedTotal});
}

/// @nodoc
class _$VestingStateCopyWithImpl<$Res, $Val extends VestingState>
    implements $VestingStateCopyWith<$Res> {
  _$VestingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vestingSchedule = null,
    Object? scheduleIDs = null,
    Object? hasVestingSchedule = null,
    Object? currentAmountReleasable = freezed,
    Object? scheduleEnd = freezed,
    Object? scheduleStart = freezed,
    Object? displayScheduleID = freezed,
    Object? scheduleCount = freezed,
    Object? isContractFullyVested = null,
    Object? withdrawableAmount = freezed,
    Object? cliffEndDays = null,
    Object? endTimeDays = null,
    Object? vestedChecker = null,
    Object? isLoading = null,
    Object? isRevoked = null,
    Object? cliff = freezed,
    Object? vestedTotal = freezed,
  }) {
    return _then(_value.copyWith(
      vestingSchedule: null == vestingSchedule
          ? _value.vestingSchedule
          : vestingSchedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      scheduleIDs: null == scheduleIDs
          ? _value.scheduleIDs
          : scheduleIDs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      hasVestingSchedule: null == hasVestingSchedule
          ? _value.hasVestingSchedule
          : hasVestingSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      currentAmountReleasable: freezed == currentAmountReleasable
          ? _value.currentAmountReleasable
          : currentAmountReleasable // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      scheduleEnd: freezed == scheduleEnd
          ? _value.scheduleEnd
          : scheduleEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduleStart: freezed == scheduleStart
          ? _value.scheduleStart
          : scheduleStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      displayScheduleID: freezed == displayScheduleID
          ? _value.displayScheduleID
          : displayScheduleID // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleCount: freezed == scheduleCount
          ? _value.scheduleCount
          : scheduleCount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      isContractFullyVested: null == isContractFullyVested
          ? _value.isContractFullyVested
          : isContractFullyVested // ignore: cast_nullable_to_non_nullable
              as bool,
      withdrawableAmount: freezed == withdrawableAmount
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      cliffEndDays: null == cliffEndDays
          ? _value.cliffEndDays
          : cliffEndDays // ignore: cast_nullable_to_non_nullable
              as int,
      endTimeDays: null == endTimeDays
          ? _value.endTimeDays
          : endTimeDays // ignore: cast_nullable_to_non_nullable
              as int,
      vestedChecker: null == vestedChecker
          ? _value.vestedChecker
          : vestedChecker // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRevoked: null == isRevoked
          ? _value.isRevoked
          : isRevoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cliff: freezed == cliff
          ? _value.cliff
          : cliff // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vestedTotal: freezed == vestedTotal
          ? _value.vestedTotal
          : vestedTotal // ignore: cast_nullable_to_non_nullable
              as Decimal?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VestingStateCopyWith<$Res>
    implements $VestingStateCopyWith<$Res> {
  factory _$$_VestingStateCopyWith(
          _$_VestingState value, $Res Function(_$_VestingState) then) =
      __$$_VestingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<Schedules> vestingSchedule,
      @JsonKey(ignore: true) List<dynamic> scheduleIDs,
      @JsonKey(ignore: true) bool hasVestingSchedule,
      @JsonKey(ignore: true) Decimal? currentAmountReleasable,
      @JsonKey(ignore: true) DateTime? scheduleEnd,
      @JsonKey(ignore: true) DateTime? scheduleStart,
      @JsonKey(ignore: true) String? displayScheduleID,
      @JsonKey(ignore: true) BigInt? scheduleCount,
      @JsonKey(ignore: true) bool isContractFullyVested,
      @JsonKey(ignore: true) BigInt? withdrawableAmount,
      @JsonKey(ignore: true) int cliffEndDays,
      @JsonKey(ignore: true) int endTimeDays,
      @JsonKey(ignore: true) bool vestedChecker,
      @JsonKey(ignore: true) bool isLoading,
      @JsonKey(ignore: true) bool isRevoked,
      @JsonKey(ignore: true) DateTime? cliff,
      @JsonKey(ignore: true) Decimal? vestedTotal});
}

/// @nodoc
class __$$_VestingStateCopyWithImpl<$Res>
    extends _$VestingStateCopyWithImpl<$Res, _$_VestingState>
    implements _$$_VestingStateCopyWith<$Res> {
  __$$_VestingStateCopyWithImpl(
      _$_VestingState _value, $Res Function(_$_VestingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vestingSchedule = null,
    Object? scheduleIDs = null,
    Object? hasVestingSchedule = null,
    Object? currentAmountReleasable = freezed,
    Object? scheduleEnd = freezed,
    Object? scheduleStart = freezed,
    Object? displayScheduleID = freezed,
    Object? scheduleCount = freezed,
    Object? isContractFullyVested = null,
    Object? withdrawableAmount = freezed,
    Object? cliffEndDays = null,
    Object? endTimeDays = null,
    Object? vestedChecker = null,
    Object? isLoading = null,
    Object? isRevoked = null,
    Object? cliff = freezed,
    Object? vestedTotal = freezed,
  }) {
    return _then(_$_VestingState(
      vestingSchedule: null == vestingSchedule
          ? _value.vestingSchedule
          : vestingSchedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      scheduleIDs: null == scheduleIDs
          ? _value.scheduleIDs
          : scheduleIDs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      hasVestingSchedule: null == hasVestingSchedule
          ? _value.hasVestingSchedule
          : hasVestingSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      currentAmountReleasable: freezed == currentAmountReleasable
          ? _value.currentAmountReleasable
          : currentAmountReleasable // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      scheduleEnd: freezed == scheduleEnd
          ? _value.scheduleEnd
          : scheduleEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduleStart: freezed == scheduleStart
          ? _value.scheduleStart
          : scheduleStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      displayScheduleID: freezed == displayScheduleID
          ? _value.displayScheduleID
          : displayScheduleID // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleCount: freezed == scheduleCount
          ? _value.scheduleCount
          : scheduleCount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      isContractFullyVested: null == isContractFullyVested
          ? _value.isContractFullyVested
          : isContractFullyVested // ignore: cast_nullable_to_non_nullable
              as bool,
      withdrawableAmount: freezed == withdrawableAmount
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      cliffEndDays: null == cliffEndDays
          ? _value.cliffEndDays
          : cliffEndDays // ignore: cast_nullable_to_non_nullable
              as int,
      endTimeDays: null == endTimeDays
          ? _value.endTimeDays
          : endTimeDays // ignore: cast_nullable_to_non_nullable
              as int,
      vestedChecker: null == vestedChecker
          ? _value.vestedChecker
          : vestedChecker // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRevoked: null == isRevoked
          ? _value.isRevoked
          : isRevoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cliff: freezed == cliff
          ? _value.cliff
          : cliff // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vestedTotal: freezed == vestedTotal
          ? _value.vestedTotal
          : vestedTotal // ignore: cast_nullable_to_non_nullable
              as Decimal?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VestingState extends _VestingState {
  _$_VestingState(
      {@JsonKey(ignore: true) this.vestingSchedule = const [],
      @JsonKey(ignore: true) this.scheduleIDs = const [],
      @JsonKey(ignore: true) this.hasVestingSchedule = false,
      @JsonKey(ignore: true) this.currentAmountReleasable = null,
      @JsonKey(ignore: true) this.scheduleEnd = null,
      @JsonKey(ignore: true) this.scheduleStart = null,
      @JsonKey(ignore: true) this.displayScheduleID = "",
      @JsonKey(ignore: true) this.scheduleCount = null,
      @JsonKey(ignore: true) this.isContractFullyVested = false,
      @JsonKey(ignore: true) this.withdrawableAmount = null,
      @JsonKey(ignore: true) this.cliffEndDays = 0,
      @JsonKey(ignore: true) this.endTimeDays = 0,
      @JsonKey(ignore: true) this.vestedChecker = false,
      @JsonKey(ignore: true) this.isLoading = true,
      @JsonKey(ignore: true) this.isRevoked = false,
      @JsonKey(ignore: true) this.cliff = null,
      @JsonKey(ignore: true) this.vestedTotal = null})
      : super._();

  factory _$_VestingState.fromJson(Map<String, dynamic> json) =>
      _$$_VestingStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final List<Schedules> vestingSchedule;
  @override
  @JsonKey(ignore: true)
  final List<dynamic> scheduleIDs;
  @override
  @JsonKey(ignore: true)
  final bool hasVestingSchedule;
  @override
  @JsonKey(ignore: true)
  final Decimal? currentAmountReleasable;
  @override
  @JsonKey(ignore: true)
  final DateTime? scheduleEnd;
  @override
  @JsonKey(ignore: true)
  final DateTime? scheduleStart;
  @override
  @JsonKey(ignore: true)
  final String? displayScheduleID;
  @override
  @JsonKey(ignore: true)
  final BigInt? scheduleCount;
  @override
  @JsonKey(ignore: true)
  final bool isContractFullyVested;
  @override
  @JsonKey(ignore: true)
  final BigInt? withdrawableAmount;
  @override
  @JsonKey(ignore: true)
  final int cliffEndDays;
  @override
  @JsonKey(ignore: true)
  final int endTimeDays;
  @override
  @JsonKey(ignore: true)
  final bool vestedChecker;
  @override
  @JsonKey(ignore: true)
  final bool isLoading;
  @override
  @JsonKey(ignore: true)
  final bool isRevoked;
  @override
  @JsonKey(ignore: true)
  final DateTime? cliff;
  @override
  @JsonKey(ignore: true)
  final Decimal? vestedTotal;

  @override
  String toString() {
    return 'VestingState(vestingSchedule: $vestingSchedule, scheduleIDs: $scheduleIDs, hasVestingSchedule: $hasVestingSchedule, currentAmountReleasable: $currentAmountReleasable, scheduleEnd: $scheduleEnd, scheduleStart: $scheduleStart, displayScheduleID: $displayScheduleID, scheduleCount: $scheduleCount, isContractFullyVested: $isContractFullyVested, withdrawableAmount: $withdrawableAmount, cliffEndDays: $cliffEndDays, endTimeDays: $endTimeDays, vestedChecker: $vestedChecker, isLoading: $isLoading, isRevoked: $isRevoked, cliff: $cliff, vestedTotal: $vestedTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VestingState &&
            const DeepCollectionEquality()
                .equals(other.vestingSchedule, vestingSchedule) &&
            const DeepCollectionEquality()
                .equals(other.scheduleIDs, scheduleIDs) &&
            (identical(other.hasVestingSchedule, hasVestingSchedule) ||
                other.hasVestingSchedule == hasVestingSchedule) &&
            (identical(
                    other.currentAmountReleasable, currentAmountReleasable) ||
                other.currentAmountReleasable == currentAmountReleasable) &&
            (identical(other.scheduleEnd, scheduleEnd) ||
                other.scheduleEnd == scheduleEnd) &&
            (identical(other.scheduleStart, scheduleStart) ||
                other.scheduleStart == scheduleStart) &&
            (identical(other.displayScheduleID, displayScheduleID) ||
                other.displayScheduleID == displayScheduleID) &&
            (identical(other.scheduleCount, scheduleCount) ||
                other.scheduleCount == scheduleCount) &&
            (identical(other.isContractFullyVested, isContractFullyVested) ||
                other.isContractFullyVested == isContractFullyVested) &&
            (identical(other.withdrawableAmount, withdrawableAmount) ||
                other.withdrawableAmount == withdrawableAmount) &&
            (identical(other.cliffEndDays, cliffEndDays) ||
                other.cliffEndDays == cliffEndDays) &&
            (identical(other.endTimeDays, endTimeDays) ||
                other.endTimeDays == endTimeDays) &&
            (identical(other.vestedChecker, vestedChecker) ||
                other.vestedChecker == vestedChecker) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRevoked, isRevoked) ||
                other.isRevoked == isRevoked) &&
            (identical(other.cliff, cliff) || other.cliff == cliff) &&
            (identical(other.vestedTotal, vestedTotal) ||
                other.vestedTotal == vestedTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vestingSchedule),
      const DeepCollectionEquality().hash(scheduleIDs),
      hasVestingSchedule,
      currentAmountReleasable,
      scheduleEnd,
      scheduleStart,
      displayScheduleID,
      scheduleCount,
      isContractFullyVested,
      withdrawableAmount,
      cliffEndDays,
      endTimeDays,
      vestedChecker,
      isLoading,
      isRevoked,
      cliff,
      vestedTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      __$$_VestingStateCopyWithImpl<_$_VestingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VestingStateToJson(
      this,
    );
  }
}

abstract class _VestingState extends VestingState {
  factory _VestingState(
      {@JsonKey(ignore: true) final List<Schedules> vestingSchedule,
      @JsonKey(ignore: true) final List<dynamic> scheduleIDs,
      @JsonKey(ignore: true) final bool hasVestingSchedule,
      @JsonKey(ignore: true) final Decimal? currentAmountReleasable,
      @JsonKey(ignore: true) final DateTime? scheduleEnd,
      @JsonKey(ignore: true) final DateTime? scheduleStart,
      @JsonKey(ignore: true) final String? displayScheduleID,
      @JsonKey(ignore: true) final BigInt? scheduleCount,
      @JsonKey(ignore: true) final bool isContractFullyVested,
      @JsonKey(ignore: true) final BigInt? withdrawableAmount,
      @JsonKey(ignore: true) final int cliffEndDays,
      @JsonKey(ignore: true) final int endTimeDays,
      @JsonKey(ignore: true) final bool vestedChecker,
      @JsonKey(ignore: true) final bool isLoading,
      @JsonKey(ignore: true) final bool isRevoked,
      @JsonKey(ignore: true) final DateTime? cliff,
      @JsonKey(ignore: true) final Decimal? vestedTotal}) = _$_VestingState;
  _VestingState._() : super._();

  factory _VestingState.fromJson(Map<String, dynamic> json) =
      _$_VestingState.fromJson;

  @override
  @JsonKey(ignore: true)
  List<Schedules> get vestingSchedule;
  @override
  @JsonKey(ignore: true)
  List<dynamic> get scheduleIDs;
  @override
  @JsonKey(ignore: true)
  bool get hasVestingSchedule;
  @override
  @JsonKey(ignore: true)
  Decimal? get currentAmountReleasable;
  @override
  @JsonKey(ignore: true)
  DateTime? get scheduleEnd;
  @override
  @JsonKey(ignore: true)
  DateTime? get scheduleStart;
  @override
  @JsonKey(ignore: true)
  String? get displayScheduleID;
  @override
  @JsonKey(ignore: true)
  BigInt? get scheduleCount;
  @override
  @JsonKey(ignore: true)
  bool get isContractFullyVested;
  @override
  @JsonKey(ignore: true)
  BigInt? get withdrawableAmount;
  @override
  @JsonKey(ignore: true)
  int get cliffEndDays;
  @override
  @JsonKey(ignore: true)
  int get endTimeDays;
  @override
  @JsonKey(ignore: true)
  bool get vestedChecker;
  @override
  @JsonKey(ignore: true)
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  bool get isRevoked;
  @override
  @JsonKey(ignore: true)
  DateTime? get cliff;
  @override
  @JsonKey(ignore: true)
  Decimal? get vestedTotal;
  @override
  @JsonKey(ignore: true)
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}
