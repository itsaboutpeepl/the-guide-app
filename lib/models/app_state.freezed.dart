// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @HomePageStateConverter()
  HomePageState get homePageState => throw _privateConstructorUsedError;
  @NewsStateConverter()
  NewsState get newsState => throw _privateConstructorUsedError;
  @NetworkTabStateConverter()
  NetworkTabState get networkTabState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {@UserStateConverter() UserState userState,
      @CashWalletStateConverter() CashWalletState cashWalletState,
      @HomePageStateConverter() HomePageState homePageState,
      @NewsStateConverter() NewsState newsState,
      @NetworkTabStateConverter() NetworkTabState networkTabState});

  $UserStateCopyWith<$Res> get userState;
  $CashWalletStateCopyWith<$Res> get cashWalletState;
  $HomePageStateCopyWith<$Res> get homePageState;
  $NewsStateCopyWith<$Res> get newsState;
  $NetworkTabStateCopyWith<$Res> get networkTabState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
    Object? cashWalletState = null,
    Object? homePageState = null,
    Object? newsState = null,
    Object? networkTabState = null,
  }) {
    return _then(_value.copyWith(
      userState: null == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
      cashWalletState: null == cashWalletState
          ? _value.cashWalletState
          : cashWalletState // ignore: cast_nullable_to_non_nullable
              as CashWalletState,
      homePageState: null == homePageState
          ? _value.homePageState
          : homePageState // ignore: cast_nullable_to_non_nullable
              as HomePageState,
      newsState: null == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsState,
      networkTabState: null == networkTabState
          ? _value.networkTabState
          : networkTabState // ignore: cast_nullable_to_non_nullable
              as NetworkTabState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res> get userState {
    return $UserStateCopyWith<$Res>(_value.userState, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CashWalletStateCopyWith<$Res> get cashWalletState {
    return $CashWalletStateCopyWith<$Res>(_value.cashWalletState, (value) {
      return _then(_value.copyWith(cashWalletState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HomePageStateCopyWith<$Res> get homePageState {
    return $HomePageStateCopyWith<$Res>(_value.homePageState, (value) {
      return _then(_value.copyWith(homePageState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsStateCopyWith<$Res> get newsState {
    return $NewsStateCopyWith<$Res>(_value.newsState, (value) {
      return _then(_value.copyWith(newsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkTabStateCopyWith<$Res> get networkTabState {
    return $NetworkTabStateCopyWith<$Res>(_value.networkTabState, (value) {
      return _then(_value.copyWith(networkTabState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UserStateConverter() UserState userState,
      @CashWalletStateConverter() CashWalletState cashWalletState,
      @HomePageStateConverter() HomePageState homePageState,
      @NewsStateConverter() NewsState newsState,
      @NetworkTabStateConverter() NetworkTabState networkTabState});

  @override
  $UserStateCopyWith<$Res> get userState;
  @override
  $CashWalletStateCopyWith<$Res> get cashWalletState;
  @override
  $HomePageStateCopyWith<$Res> get homePageState;
  @override
  $NewsStateCopyWith<$Res> get newsState;
  @override
  $NetworkTabStateCopyWith<$Res> get networkTabState;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
    Object? cashWalletState = null,
    Object? homePageState = null,
    Object? newsState = null,
    Object? networkTabState = null,
  }) {
    return _then(_$_AppState(
      userState: null == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState,
      cashWalletState: null == cashWalletState
          ? _value.cashWalletState
          : cashWalletState // ignore: cast_nullable_to_non_nullable
              as CashWalletState,
      homePageState: null == homePageState
          ? _value.homePageState
          : homePageState // ignore: cast_nullable_to_non_nullable
              as HomePageState,
      newsState: null == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsState,
      networkTabState: null == networkTabState
          ? _value.networkTabState
          : networkTabState // ignore: cast_nullable_to_non_nullable
              as NetworkTabState,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_AppState extends _AppState {
  _$_AppState(
      {@UserStateConverter() required this.userState,
      @CashWalletStateConverter() required this.cashWalletState,
      @HomePageStateConverter() required this.homePageState,
      @NewsStateConverter() required this.newsState,
      @NetworkTabStateConverter() required this.networkTabState})
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
  @HomePageStateConverter()
  final HomePageState homePageState;
  @override
  @NewsStateConverter()
  final NewsState newsState;
  @override
  @NetworkTabStateConverter()
  final NetworkTabState networkTabState;

  @override
  String toString() {
    return 'AppState(userState: $userState, cashWalletState: $cashWalletState, homePageState: $homePageState, newsState: $newsState, networkTabState: $networkTabState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.userState, userState) ||
                other.userState == userState) &&
            (identical(other.cashWalletState, cashWalletState) ||
                other.cashWalletState == cashWalletState) &&
            (identical(other.homePageState, homePageState) ||
                other.homePageState == homePageState) &&
            (identical(other.newsState, newsState) ||
                other.newsState == newsState) &&
            (identical(other.networkTabState, networkTabState) ||
                other.networkTabState == networkTabState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userState, cashWalletState,
      homePageState, newsState, networkTabState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(
      this,
    );
  }
}

abstract class _AppState extends AppState {
  factory _AppState(
      {@UserStateConverter()
          required final UserState userState,
      @CashWalletStateConverter()
          required final CashWalletState cashWalletState,
      @HomePageStateConverter()
          required final HomePageState homePageState,
      @NewsStateConverter()
          required final NewsState newsState,
      @NetworkTabStateConverter()
          required final NetworkTabState networkTabState}) = _$_AppState;
  _AppState._() : super._();

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  @UserStateConverter()
  UserState get userState;
  @override
  @CashWalletStateConverter()
  CashWalletState get cashWalletState;
  @override
  @HomePageStateConverter()
  HomePageState get homePageState;
  @override
  @NewsStateConverter()
  NewsState get newsState;
  @override
  @NetworkTabStateConverter()
  NetworkTabState get networkTabState;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
