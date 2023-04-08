// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  BigInt get amount => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;
  bool get isNative => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  Price? get priceInfo => throw _privateConstructorUsedError;
  String? get communityAddress => throw _privateConstructorUsedError;
  TimeFrame get timeFrame => throw _privateConstructorUsedError;
  num get priceChange => throw _privateConstructorUsedError;
  List<IntervalStats> get intervalStats => throw _privateConstructorUsedError;
  @JsonKey(fromJson: walletActionsFromJson)
  WalletActions? get walletActions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call(
      {String address,
      String name,
      String symbol,
      BigInt amount,
      int decimals,
      bool isNative,
      String? imageUrl,
      int? timestamp,
      Price? priceInfo,
      String? communityAddress,
      TimeFrame timeFrame,
      num priceChange,
      List<IntervalStats> intervalStats,
      @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions});

  $PriceCopyWith<$Res>? get priceInfo;
  $WalletActionsCopyWith<$Res>? get walletActions;
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? name = null,
    Object? symbol = null,
    Object? amount = null,
    Object? decimals = null,
    Object? isNative = null,
    Object? imageUrl = freezed,
    Object? timestamp = freezed,
    Object? priceInfo = freezed,
    Object? communityAddress = freezed,
    Object? timeFrame = null,
    Object? priceChange = null,
    Object? intervalStats = null,
    Object? walletActions = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      isNative: null == isNative
          ? _value.isNative
          : isNative // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      priceInfo: freezed == priceInfo
          ? _value.priceInfo
          : priceInfo // ignore: cast_nullable_to_non_nullable
              as Price?,
      communityAddress: freezed == communityAddress
          ? _value.communityAddress
          : communityAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as TimeFrame,
      priceChange: null == priceChange
          ? _value.priceChange
          : priceChange // ignore: cast_nullable_to_non_nullable
              as num,
      intervalStats: null == intervalStats
          ? _value.intervalStats
          : intervalStats // ignore: cast_nullable_to_non_nullable
              as List<IntervalStats>,
      walletActions: freezed == walletActions
          ? _value.walletActions
          : walletActions // ignore: cast_nullable_to_non_nullable
              as WalletActions?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res>? get priceInfo {
    if (_value.priceInfo == null) {
      return null;
    }

    return $PriceCopyWith<$Res>(_value.priceInfo!, (value) {
      return _then(_value.copyWith(priceInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletActionsCopyWith<$Res>? get walletActions {
    if (_value.walletActions == null) {
      return null;
    }

    return $WalletActionsCopyWith<$Res>(_value.walletActions!, (value) {
      return _then(_value.copyWith(walletActions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String name,
      String symbol,
      BigInt amount,
      int decimals,
      bool isNative,
      String? imageUrl,
      int? timestamp,
      Price? priceInfo,
      String? communityAddress,
      TimeFrame timeFrame,
      num priceChange,
      List<IntervalStats> intervalStats,
      @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions});

  @override
  $PriceCopyWith<$Res>? get priceInfo;
  @override
  $WalletActionsCopyWith<$Res>? get walletActions;
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res, _$_Token>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? name = null,
    Object? symbol = null,
    Object? amount = null,
    Object? decimals = null,
    Object? isNative = null,
    Object? imageUrl = freezed,
    Object? timestamp = freezed,
    Object? priceInfo = freezed,
    Object? communityAddress = freezed,
    Object? timeFrame = null,
    Object? priceChange = null,
    Object? intervalStats = null,
    Object? walletActions = freezed,
  }) {
    return _then(_$_Token(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      isNative: null == isNative
          ? _value.isNative
          : isNative // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      priceInfo: freezed == priceInfo
          ? _value.priceInfo
          : priceInfo // ignore: cast_nullable_to_non_nullable
              as Price?,
      communityAddress: freezed == communityAddress
          ? _value.communityAddress
          : communityAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as TimeFrame,
      priceChange: null == priceChange
          ? _value.priceChange
          : priceChange // ignore: cast_nullable_to_non_nullable
              as num,
      intervalStats: null == intervalStats
          ? _value.intervalStats
          : intervalStats // ignore: cast_nullable_to_non_nullable
              as List<IntervalStats>,
      walletActions: freezed == walletActions
          ? _value.walletActions
          : walletActions // ignore: cast_nullable_to_non_nullable
              as WalletActions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Token extends _Token {
  _$_Token(
      {required this.address,
      required this.name,
      required this.symbol,
      required this.amount,
      required this.decimals,
      this.isNative = false,
      this.imageUrl,
      this.timestamp,
      this.priceInfo,
      this.communityAddress,
      this.timeFrame = TimeFrame.day,
      this.priceChange = 0,
      this.intervalStats = const [],
      @JsonKey(fromJson: walletActionsFromJson) this.walletActions})
      : super._();

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  @override
  final String address;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final BigInt amount;
  @override
  final int decimals;
  @override
  @JsonKey()
  final bool isNative;
  @override
  final String? imageUrl;
  @override
  final int? timestamp;
  @override
  final Price? priceInfo;
  @override
  final String? communityAddress;
  @override
  @JsonKey()
  final TimeFrame timeFrame;
  @override
  @JsonKey()
  final num priceChange;
  @override
  @JsonKey()
  final List<IntervalStats> intervalStats;
  @override
  @JsonKey(fromJson: walletActionsFromJson)
  final WalletActions? walletActions;

  @override
  String toString() {
    return 'Token(address: $address, name: $name, symbol: $symbol, amount: $amount, decimals: $decimals, isNative: $isNative, imageUrl: $imageUrl, timestamp: $timestamp, priceInfo: $priceInfo, communityAddress: $communityAddress, timeFrame: $timeFrame, priceChange: $priceChange, intervalStats: $intervalStats, walletActions: $walletActions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.isNative, isNative) ||
                other.isNative == isNative) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.priceInfo, priceInfo) ||
                other.priceInfo == priceInfo) &&
            (identical(other.communityAddress, communityAddress) ||
                other.communityAddress == communityAddress) &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            (identical(other.priceChange, priceChange) ||
                other.priceChange == priceChange) &&
            const DeepCollectionEquality()
                .equals(other.intervalStats, intervalStats) &&
            (identical(other.walletActions, walletActions) ||
                other.walletActions == walletActions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      name,
      symbol,
      amount,
      decimals,
      isNative,
      imageUrl,
      timestamp,
      priceInfo,
      communityAddress,
      timeFrame,
      priceChange,
      const DeepCollectionEquality().hash(intervalStats),
      walletActions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(
      this,
    );
  }
}

abstract class _Token extends Token {
  factory _Token(
      {required final String address,
      required final String name,
      required final String symbol,
      required final BigInt amount,
      required final int decimals,
      final bool isNative,
      final String? imageUrl,
      final int? timestamp,
      final Price? priceInfo,
      final String? communityAddress,
      final TimeFrame timeFrame,
      final num priceChange,
      final List<IntervalStats> intervalStats,
      @JsonKey(fromJson: walletActionsFromJson)
          final WalletActions? walletActions}) = _$_Token;
  _Token._() : super._();

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  String get address;
  @override
  String get name;
  @override
  String get symbol;
  @override
  BigInt get amount;
  @override
  int get decimals;
  @override
  bool get isNative;
  @override
  String? get imageUrl;
  @override
  int? get timestamp;
  @override
  Price? get priceInfo;
  @override
  String? get communityAddress;
  @override
  TimeFrame get timeFrame;
  @override
  num get priceChange;
  @override
  List<IntervalStats> get intervalStats;
  @override
  @JsonKey(fromJson: walletActionsFromJson)
  WalletActions? get walletActions;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}
