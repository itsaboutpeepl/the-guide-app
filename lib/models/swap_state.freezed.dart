// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'swap_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SwapState _$SwapStateFromJson(Map<String, dynamic> json) {
  return _SwapState.fromJson(json);
}

/// @nodoc
mixin _$SwapState {
  @JsonKey(ignore: true)
  Map<String, Token> get tokens => throw _privateConstructorUsedError;
  Map<String, String> get tokensImages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SwapStateCopyWith<SwapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapStateCopyWith<$Res> {
  factory $SwapStateCopyWith(SwapState value, $Res Function(SwapState) then) =
      _$SwapStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) Map<String, Token> tokens,
      Map<String, String> tokensImages});
}

/// @nodoc
class _$SwapStateCopyWithImpl<$Res> implements $SwapStateCopyWith<$Res> {
  _$SwapStateCopyWithImpl(this._value, this._then);

  final SwapState _value;
  // ignore: unused_field
  final $Res Function(SwapState) _then;

  @override
  $Res call({
    Object? tokens = freezed,
    Object? tokensImages = freezed,
  }) {
    return _then(_value.copyWith(
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as Map<String, Token>,
      tokensImages: tokensImages == freezed
          ? _value.tokensImages
          : tokensImages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$$_SwapStateCopyWith<$Res> implements $SwapStateCopyWith<$Res> {
  factory _$$_SwapStateCopyWith(
          _$_SwapState value, $Res Function(_$_SwapState) then) =
      __$$_SwapStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) Map<String, Token> tokens,
      Map<String, String> tokensImages});
}

/// @nodoc
class __$$_SwapStateCopyWithImpl<$Res> extends _$SwapStateCopyWithImpl<$Res>
    implements _$$_SwapStateCopyWith<$Res> {
  __$$_SwapStateCopyWithImpl(
      _$_SwapState _value, $Res Function(_$_SwapState) _then)
      : super(_value, (v) => _then(v as _$_SwapState));

  @override
  _$_SwapState get _value => super._value as _$_SwapState;

  @override
  $Res call({
    Object? tokens = freezed,
    Object? tokensImages = freezed,
  }) {
    return _then(_$_SwapState(
      tokens: tokens == freezed
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as Map<String, Token>,
      tokensImages: tokensImages == freezed
          ? _value._tokensImages
          : tokensImages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SwapState extends _SwapState with DiagnosticableTreeMixin {
  _$_SwapState(
      {@JsonKey(ignore: true) final Map<String, Token> tokens = const {},
      final Map<String, String> tokensImages = const {}})
      : _tokens = tokens,
        _tokensImages = tokensImages,
        super._();

  factory _$_SwapState.fromJson(Map<String, dynamic> json) =>
      _$$_SwapStateFromJson(json);

  final Map<String, Token> _tokens;
  @override
  @JsonKey(ignore: true)
  Map<String, Token> get tokens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tokens);
  }

  final Map<String, String> _tokensImages;
  @override
  @JsonKey()
  Map<String, String> get tokensImages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tokensImages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SwapState(tokens: $tokens, tokensImages: $tokensImages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SwapState'))
      ..add(DiagnosticsProperty('tokens', tokens))
      ..add(DiagnosticsProperty('tokensImages', tokensImages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SwapState &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            const DeepCollectionEquality()
                .equals(other._tokensImages, _tokensImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tokens),
      const DeepCollectionEquality().hash(_tokensImages));

  @JsonKey(ignore: true)
  @override
  _$$_SwapStateCopyWith<_$_SwapState> get copyWith =>
      __$$_SwapStateCopyWithImpl<_$_SwapState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SwapStateToJson(this);
  }
}

abstract class _SwapState extends SwapState {
  factory _SwapState(
      {@JsonKey(ignore: true) final Map<String, Token> tokens,
      final Map<String, String> tokensImages}) = _$_SwapState;
  _SwapState._() : super._();

  factory _SwapState.fromJson(Map<String, dynamic> json) =
      _$_SwapState.fromJson;

  @override
  @JsonKey(ignore: true)
  Map<String, Token> get tokens => throw _privateConstructorUsedError;
  @override
  Map<String, String> get tokensImages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SwapStateCopyWith<_$_SwapState> get copyWith =>
      throw _privateConstructorUsedError;
}
