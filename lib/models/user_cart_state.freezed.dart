// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCartState _$UserCartStateFromJson(Map<String, dynamic> json) {
  return _UserCartState.fromJson(json);
}

/// @nodoc
class _$UserCartStateTearOff {
  const _$UserCartStateTearOff();

  _UserCartState call(
      {required String paymentIntentID,
      required double selectedGBPxAmount,
      required double selectedPPLAmount,
      required bool transferringTokens,
      required bool errorCompletingPayment,
      required bool confirmedPayment,
      required String restaurantName,
      required int cartTotal}) {
    return _UserCartState(
      paymentIntentID: paymentIntentID,
      selectedGBPxAmount: selectedGBPxAmount,
      selectedPPLAmount: selectedPPLAmount,
      transferringTokens: transferringTokens,
      errorCompletingPayment: errorCompletingPayment,
      confirmedPayment: confirmedPayment,
      restaurantName: restaurantName,
      cartTotal: cartTotal,
    );
  }

  UserCartState fromJson(Map<String, Object?> json) {
    return UserCartState.fromJson(json);
  }
}

/// @nodoc
const $UserCartState = _$UserCartStateTearOff();

/// @nodoc
mixin _$UserCartState {
  String get paymentIntentID => throw _privateConstructorUsedError;
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  bool get transferringTokens => throw _privateConstructorUsedError;
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  bool get confirmedPayment => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  int get cartTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCartStateCopyWith<UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCartStateCopyWith<$Res> {
  factory $UserCartStateCopyWith(
          UserCartState value, $Res Function(UserCartState) then) =
      _$UserCartStateCopyWithImpl<$Res>;
  $Res call(
      {String paymentIntentID,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      int cartTotal});
}

/// @nodoc
class _$UserCartStateCopyWithImpl<$Res>
    implements $UserCartStateCopyWith<$Res> {
  _$UserCartStateCopyWithImpl(this._value, this._then);

  final UserCartState _value;
  // ignore: unused_field
  final $Res Function(UserCartState) _then;

  @override
  $Res call({
    Object? paymentIntentID = freezed,
    Object? selectedGBPxAmount = freezed,
    Object? selectedPPLAmount = freezed,
    Object? transferringTokens = freezed,
    Object? errorCompletingPayment = freezed,
    Object? confirmedPayment = freezed,
    Object? restaurantName = freezed,
    Object? cartTotal = freezed,
  }) {
    return _then(_value.copyWith(
      paymentIntentID: paymentIntentID == freezed
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGBPxAmount: selectedGBPxAmount == freezed
          ? _value.selectedGBPxAmount
          : selectedGBPxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPPLAmount: selectedPPLAmount == freezed
          ? _value.selectedPPLAmount
          : selectedPPLAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transferringTokens: transferringTokens == freezed
          ? _value.transferringTokens
          : transferringTokens // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCompletingPayment: errorCompletingPayment == freezed
          ? _value.errorCompletingPayment
          : errorCompletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmedPayment: confirmedPayment == freezed
          ? _value.confirmedPayment
          : confirmedPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCartStateCopyWith<$Res>
    implements $UserCartStateCopyWith<$Res> {
  factory _$UserCartStateCopyWith(
          _UserCartState value, $Res Function(_UserCartState) then) =
      __$UserCartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String paymentIntentID,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      int cartTotal});
}

/// @nodoc
class __$UserCartStateCopyWithImpl<$Res>
    extends _$UserCartStateCopyWithImpl<$Res>
    implements _$UserCartStateCopyWith<$Res> {
  __$UserCartStateCopyWithImpl(
      _UserCartState _value, $Res Function(_UserCartState) _then)
      : super(_value, (v) => _then(v as _UserCartState));

  @override
  _UserCartState get _value => super._value as _UserCartState;

  @override
  $Res call({
    Object? paymentIntentID = freezed,
    Object? selectedGBPxAmount = freezed,
    Object? selectedPPLAmount = freezed,
    Object? transferringTokens = freezed,
    Object? errorCompletingPayment = freezed,
    Object? confirmedPayment = freezed,
    Object? restaurantName = freezed,
    Object? cartTotal = freezed,
  }) {
    return _then(_UserCartState(
      paymentIntentID: paymentIntentID == freezed
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGBPxAmount: selectedGBPxAmount == freezed
          ? _value.selectedGBPxAmount
          : selectedGBPxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPPLAmount: selectedPPLAmount == freezed
          ? _value.selectedPPLAmount
          : selectedPPLAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transferringTokens: transferringTokens == freezed
          ? _value.transferringTokens
          : transferringTokens // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCompletingPayment: errorCompletingPayment == freezed
          ? _value.errorCompletingPayment
          : errorCompletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmedPayment: confirmedPayment == freezed
          ? _value.confirmedPayment
          : confirmedPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCartState extends _UserCartState {
  _$_UserCartState(
      {required this.paymentIntentID,
      required this.selectedGBPxAmount,
      required this.selectedPPLAmount,
      required this.transferringTokens,
      required this.errorCompletingPayment,
      required this.confirmedPayment,
      required this.restaurantName,
      required this.cartTotal})
      : super._();

  factory _$_UserCartState.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartStateFromJson(json);

  @override
  final String paymentIntentID;
  @override
  final double selectedGBPxAmount;
  @override
  final double selectedPPLAmount;
  @override
  final bool transferringTokens;
  @override
  final bool errorCompletingPayment;
  @override
  final bool confirmedPayment;
  @override
  final String restaurantName;
  @override
  final int cartTotal;

  @override
  String toString() {
    return 'UserCartState(paymentIntentID: $paymentIntentID, selectedGBPxAmount: $selectedGBPxAmount, selectedPPLAmount: $selectedPPLAmount, transferringTokens: $transferringTokens, errorCompletingPayment: $errorCompletingPayment, confirmedPayment: $confirmedPayment, restaurantName: $restaurantName, cartTotal: $cartTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCartState &&
            const DeepCollectionEquality()
                .equals(other.paymentIntentID, paymentIntentID) &&
            const DeepCollectionEquality()
                .equals(other.selectedGBPxAmount, selectedGBPxAmount) &&
            const DeepCollectionEquality()
                .equals(other.selectedPPLAmount, selectedPPLAmount) &&
            const DeepCollectionEquality()
                .equals(other.transferringTokens, transferringTokens) &&
            const DeepCollectionEquality()
                .equals(other.errorCompletingPayment, errorCompletingPayment) &&
            const DeepCollectionEquality()
                .equals(other.confirmedPayment, confirmedPayment) &&
            const DeepCollectionEquality()
                .equals(other.restaurantName, restaurantName) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentIntentID),
      const DeepCollectionEquality().hash(selectedGBPxAmount),
      const DeepCollectionEquality().hash(selectedPPLAmount),
      const DeepCollectionEquality().hash(transferringTokens),
      const DeepCollectionEquality().hash(errorCompletingPayment),
      const DeepCollectionEquality().hash(confirmedPayment),
      const DeepCollectionEquality().hash(restaurantName),
      const DeepCollectionEquality().hash(cartTotal));

  @JsonKey(ignore: true)
  @override
  _$UserCartStateCopyWith<_UserCartState> get copyWith =>
      __$UserCartStateCopyWithImpl<_UserCartState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCartStateToJson(this);
  }
}

abstract class _UserCartState extends UserCartState {
  factory _UserCartState(
      {required String paymentIntentID,
      required double selectedGBPxAmount,
      required double selectedPPLAmount,
      required bool transferringTokens,
      required bool errorCompletingPayment,
      required bool confirmedPayment,
      required String restaurantName,
      required int cartTotal}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  String get paymentIntentID;
  @override
  double get selectedGBPxAmount;
  @override
  double get selectedPPLAmount;
  @override
  bool get transferringTokens;
  @override
  bool get errorCompletingPayment;
  @override
  bool get confirmedPayment;
  @override
  String get restaurantName;
  @override
  int get cartTotal;
  @override
  @JsonKey(ignore: true)
  _$UserCartStateCopyWith<_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
