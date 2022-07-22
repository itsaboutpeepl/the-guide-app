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
  BigInt get amount => throw _privateConstructorUsedError;

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
  $Res call({BigInt amount});
}

/// @nodoc
class _$VestingStateCopyWithImpl<$Res> implements $VestingStateCopyWith<$Res> {
  _$VestingStateCopyWithImpl(this._value, this._then);

  final VestingState _value;
  // ignore: unused_field
  final $Res Function(VestingState) _then;

  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
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
  $Res call({BigInt amount});
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
    Object? amount = freezed,
  }) {
    return _then(_$_VestingState(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VestingState extends _VestingState {
  _$_VestingState({required this.amount}) : super._();

  factory _$_VestingState.fromJson(Map<String, dynamic> json) =>
      _$$_VestingStateFromJson(json);

  @override
  final BigInt amount;

  @override
  String toString() {
    return 'VestingState(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VestingState &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(amount));

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
  factory _VestingState({required final BigInt amount}) = _$_VestingState;
  _VestingState._() : super._();

  factory _VestingState.fromJson(Map<String, dynamic> json) =
      _$_VestingState.fromJson;

  @override
  BigInt get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VestingStateCopyWith<_$_VestingState> get copyWith =>
      throw _privateConstructorUsedError;
}
