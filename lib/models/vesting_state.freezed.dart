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
      _$VestingStateCopyWithImpl<$Res>;
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
    Object? vestedTotal = freezed,
  }) {
    return _then(_value.copyWith(
      vestingSchedule: vestingSchedule == freezed
          ? _value.vestingSchedule
          : vestingSchedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      scheduleIDs: scheduleIDs == freezed
          ? _value.scheduleIDs
          : scheduleIDs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      hasVestingSchedule: hasVestingSchedule == freezed
          ? _value.hasVestingSchedule
          : hasVestingSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      currentAmountReleasable: currentAmountReleasable == freezed
          ? _value.currentAmountReleasable
          : currentAmountReleasable // ignore: cast_nullable_to_non_nullable
              as Decimal?,
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
              as BigInt?,
      isContractFullyVested: isContractFullyVested == freezed
          ? _value.isContractFullyVested
          : isContractFullyVested // ignore: cast_nullable_to_non_nullable
              as bool,
      withdrawableAmount: withdrawableAmount == freezed
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
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
      vestedTotal: vestedTotal == freezed
          ? _value.vestedTotal
          : vestedTotal // ignore: cast_nullable_to_non_nullable
              as Decimal?,
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
    Object? vestedTotal = freezed,
  }) {
    return _then(_$_VestingState(
      vestingSchedule: vestingSchedule == freezed
          ? _value.vestingSchedule
          : vestingSchedule // ignore: cast_nullable_to_non_nullable
              as List<Schedules>,
      scheduleIDs: scheduleIDs == freezed
          ? _value.scheduleIDs
          : scheduleIDs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      hasVestingSchedule: hasVestingSchedule == freezed
          ? _value.hasVestingSchedule
          : hasVestingSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      currentAmountReleasable: currentAmountReleasable == freezed
          ? _value.currentAmountReleasable
          : currentAmountReleasable // ignore: cast_nullable_to_non_nullable
              as Decimal?,
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
              as BigInt?,
      isContractFullyVested: isContractFullyVested == freezed
          ? _value.isContractFullyVested
          : isContractFullyVested // ignore: cast_nullable_to_non_nullable
              as bool,
      withdrawableAmount: withdrawableAmount == freezed
          ? _value.withdrawableAmount
          : withdrawableAmount // ignore: cast_nullable_to_non_nullable
              as BigInt?,
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
      vestedTotal: vestedTotal == freezed
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
            const DeepCollectionEquality().equals(other.cliff, cliff) &&
            const DeepCollectionEquality()
                .equals(other.vestedTotal, vestedTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vestingSchedule),
      const DeepCollectionEquality().hash(scheduleIDs),
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
      const DeepCollectionEquality().hash(cliff),
      const DeepCollectionEquality().hash(vestedTotal));

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
  List<Schedules> get vestingSchedule => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<dynamic> get scheduleIDs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get hasVestingSchedule => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Decimal? get currentAmountReleasable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  DateTime? get scheduleEnd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  DateTime? get scheduleStart => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String? get displayScheduleID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  BigInt? get scheduleCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isContractFullyVested => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  BigInt? get withdrawableAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cliffEndDays => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get endTimeDays => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get vestedChecker => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isRevoked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  DateTime? get cliff => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Decimal? get vestedTotal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}
