// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  @UserStateConverter()
  UserState get userState => throw _privateConstructorUsedError;
  @CashWalletStateConverter()
  CashWalletState get cashWalletState => throw _privateConstructorUsedError;
  @SwapStateConverter()
  SwapState get swapState => throw _privateConstructorUsedError;
  @HomePageStateConverter()
  HomePageState get homePageState => throw _privateConstructorUsedError;
  @NewsStateConverter()
  NewsState get newsState => throw _privateConstructorUsedError;
  @UserCartStateConverter()
  UserCartState get cartState => throw _privateConstructorUsedError;
  @VestingStateConverter()
  VestingState get vestingState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {@UserStateConverter() UserState userState,
      @CashWalletStateConverter() CashWalletState cashWalletState,
      @SwapStateConverter() SwapState swapState,
      @HomePageStateConverter() HomePageState homePageState,
      @NewsStateConverter() NewsState newsState,
      @UserCartStateConverter() UserCartState cartState,
      @VestingStateConverter() VestingState vestingState});

  $UserStateCopyWith<$Res> get userState;
  $CashWalletStateCopyWith<$Res> get cashWalletState;
  $SwapStateCopyWith<$Res> get swapState;
  $HomePageStateCopyWith<$Res> get homePageState;
  $NewsStateCopyWith<$Res> get newsState;
  $UserCartStateCopyWith<$Res> get cartState;
  $VestingStateCopyWith<$Res> get vestingState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? userState = freezed,
    Object? cashWalletState = freezed,
    Object? swapState = freezed,
    Object? homePageState = freezed,
    Object? newsState = freezed,
    Object? cartState = freezed,
    Object? vestingState = freezed,
  }) {
    return _then(_value.copyWith(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
      cashWalletState: cashWalletState == freezed
          ? _value.cashWalletState
          : cashWalletState // ignore: cast_nullable_to_non_nullable
              as CashWalletState,
      swapState: swapState == freezed
          ? _value.swapState
          : swapState // ignore: cast_nullable_to_non_nullable
              as SwapState,
      homePageState: homePageState == freezed
          ? _value.homePageState
          : homePageState // ignore: cast_nullable_to_non_nullable
              as HomePageState,
      newsState: newsState == freezed
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsState,
      cartState: cartState == freezed
          ? _value.cartState
          : cartState // ignore: cast_nullable_to_non_nullable
              as UserCartState,
      vestingState: vestingState == freezed
          ? _value.vestingState
          : vestingState // ignore: cast_nullable_to_non_nullable
              as VestingState,
    ));
  }

  @override
  $UserStateCopyWith<$Res> get userState {
    return $UserStateCopyWith<$Res>(_value.userState, (value) {
      return _then(_value.copyWith(userState: value));
    });
  }

  @override
  $CashWalletStateCopyWith<$Res> get cashWalletState {
    return $CashWalletStateCopyWith<$Res>(_value.cashWalletState, (value) {
      return _then(_value.copyWith(cashWalletState: value));
    });
  }

  @override
  $SwapStateCopyWith<$Res> get swapState {
    return $SwapStateCopyWith<$Res>(_value.swapState, (value) {
      return _then(_value.copyWith(swapState: value));
    });
  }

  @override
  $HomePageStateCopyWith<$Res> get homePageState {
    return $HomePageStateCopyWith<$Res>(_value.homePageState, (value) {
      return _then(_value.copyWith(homePageState: value));
    });
  }

  @override
  $NewsStateCopyWith<$Res> get newsState {
    return $NewsStateCopyWith<$Res>(_value.newsState, (value) {
      return _then(_value.copyWith(newsState: value));
    });
  }

  @override
  $UserCartStateCopyWith<$Res> get cartState {
    return $UserCartStateCopyWith<$Res>(_value.cartState, (value) {
      return _then(_value.copyWith(cartState: value));
    });
  }

  @override
  $VestingStateCopyWith<$Res> get vestingState {
    return $VestingStateCopyWith<$Res>(_value.vestingState, (value) {
      return _then(_value.copyWith(vestingState: value));
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@UserStateConverter() UserState userState,
      @CashWalletStateConverter() CashWalletState cashWalletState,
      @SwapStateConverter() SwapState swapState,
      @HomePageStateConverter() HomePageState homePageState,
      @NewsStateConverter() NewsState newsState,
      @UserCartStateConverter() UserCartState cartState,
      @VestingStateConverter() VestingState vestingState});

  @override
  $UserStateCopyWith<$Res> get userState;
  @override
  $CashWalletStateCopyWith<$Res> get cashWalletState;
  @override
  $SwapStateCopyWith<$Res> get swapState;
  @override
  $HomePageStateCopyWith<$Res> get homePageState;
  @override
  $NewsStateCopyWith<$Res> get newsState;
  @override
  $UserCartStateCopyWith<$Res> get cartState;
  @override
  $VestingStateCopyWith<$Res> get vestingState;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, (v) => _then(v as _$_AppState));

  @override
  _$_AppState get _value => super._value as _$_AppState;

  @override
  $Res call({
    Object? userState = freezed,
    Object? cashWalletState = freezed,
    Object? swapState = freezed,
    Object? homePageState = freezed,
    Object? newsState = freezed,
    Object? cartState = freezed,
    Object? vestingState = freezed,
  }) {
    return _then(_$_AppState(
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
      cashWalletState: cashWalletState == freezed
          ? _value.cashWalletState
          : cashWalletState // ignore: cast_nullable_to_non_nullable
              as CashWalletState,
      swapState: swapState == freezed
          ? _value.swapState
          : swapState // ignore: cast_nullable_to_non_nullable
              as SwapState,
      homePageState: homePageState == freezed
          ? _value.homePageState
          : homePageState // ignore: cast_nullable_to_non_nullable
              as HomePageState,
      newsState: newsState == freezed
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsState,
      cartState: cartState == freezed
          ? _value.cartState
          : cartState // ignore: cast_nullable_to_non_nullable
              as UserCartState,
      vestingState: vestingState == freezed
          ? _value.vestingState
          : vestingState // ignore: cast_nullable_to_non_nullable
              as VestingState,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_AppState extends _AppState with DiagnosticableTreeMixin {
  _$_AppState(
      {@UserStateConverter() required this.userState,
      @CashWalletStateConverter() required this.cashWalletState,
      @SwapStateConverter() required this.swapState,
      @HomePageStateConverter() required this.homePageState,
      @NewsStateConverter() required this.newsState,
      @UserCartStateConverter() required this.cartState,
      @VestingStateConverter() required this.vestingState})
      : super._();

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$$_AppStateFromJson(json);

  @override
  @UserStateConverter()
  final UserState userState;
  @override
  @CashWalletStateConverter()
  final CashWalletState cashWalletState;
  @override
  @SwapStateConverter()
  final SwapState swapState;
  @override
  @HomePageStateConverter()
  final HomePageState homePageState;
  @override
  @NewsStateConverter()
  final NewsState newsState;
  @override
  @UserCartStateConverter()
  final UserCartState cartState;
  @override
  @VestingStateConverter()
  final VestingState vestingState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(userState: $userState, cashWalletState: $cashWalletState, swapState: $swapState, homePageState: $homePageState, newsState: $newsState, cartState: $cartState, vestingState: $vestingState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('userState', userState))
      ..add(DiagnosticsProperty('cashWalletState', cashWalletState))
      ..add(DiagnosticsProperty('swapState', swapState))
      ..add(DiagnosticsProperty('homePageState', homePageState))
      ..add(DiagnosticsProperty('newsState', newsState))
      ..add(DiagnosticsProperty('cartState', cartState))
      ..add(DiagnosticsProperty('vestingState', vestingState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality().equals(other.userState, userState) &&
            const DeepCollectionEquality()
                .equals(other.cashWalletState, cashWalletState) &&
            const DeepCollectionEquality().equals(other.swapState, swapState) &&
            const DeepCollectionEquality()
                .equals(other.homePageState, homePageState) &&
            const DeepCollectionEquality().equals(other.newsState, newsState) &&
            const DeepCollectionEquality().equals(other.cartState, cartState) &&
            const DeepCollectionEquality()
                .equals(other.vestingState, vestingState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userState),
      const DeepCollectionEquality().hash(cashWalletState),
      const DeepCollectionEquality().hash(swapState),
      const DeepCollectionEquality().hash(homePageState),
      const DeepCollectionEquality().hash(newsState),
      const DeepCollectionEquality().hash(cartState),
      const DeepCollectionEquality().hash(vestingState));

  @JsonKey(ignore: true)
  @override
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(this);
  }
}

abstract class _AppState extends AppState {
  factory _AppState(
      {@UserStateConverter()
          required final UserState userState,
      @CashWalletStateConverter()
          required final CashWalletState cashWalletState,
      @SwapStateConverter()
          required final SwapState swapState,
      @HomePageStateConverter()
          required final HomePageState homePageState,
      @NewsStateConverter()
          required final NewsState newsState,
      @UserCartStateConverter()
          required final UserCartState cartState,
      @VestingStateConverter()
          required final VestingState vestingState}) = _$_AppState;
  _AppState._() : super._();

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  @UserStateConverter()
  UserState get userState => throw _privateConstructorUsedError;
  @override
  @CashWalletStateConverter()
  CashWalletState get cashWalletState => throw _privateConstructorUsedError;
  @override
  @SwapStateConverter()
  SwapState get swapState => throw _privateConstructorUsedError;
  @override
  @HomePageStateConverter()
  HomePageState get homePageState => throw _privateConstructorUsedError;
  @override
  @NewsStateConverter()
  NewsState get newsState => throw _privateConstructorUsedError;
  @override
  @UserCartStateConverter()
  UserCartState get cartState => throw _privateConstructorUsedError;
  @override
  @VestingStateConverter()
  VestingState get vestingState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
