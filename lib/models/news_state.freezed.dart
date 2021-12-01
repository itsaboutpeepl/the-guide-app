// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsState _$NewsStateFromJson(Map<String, dynamic> json) {
  return _NewsState.fromJson(json);
}

/// @nodoc
class _$NewsStateTearOff {
  const _$NewsStateTearOff();

  _NewsState call(
      {required List<String> categoryNames,
      required List<CategoryArticles> articles,
      required int currentTabIndex}) {
    return _NewsState(
      categoryNames: categoryNames,
      articles: articles,
      currentTabIndex: currentTabIndex,
    );
  }

  NewsState fromJson(Map<String, Object> json) {
    return NewsState.fromJson(json);
  }
}

/// @nodoc
const $NewsState = _$NewsStateTearOff();

/// @nodoc
mixin _$NewsState {
  List<String> get categoryNames => throw _privateConstructorUsedError;
  List<CategoryArticles> get articles => throw _privateConstructorUsedError;
  int get currentTabIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res>;
  $Res call(
      {List<String> categoryNames,
      List<CategoryArticles> articles,
      int currentTabIndex});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;

  @override
  $Res call({
    Object? categoryNames = freezed,
    Object? articles = freezed,
    Object? currentTabIndex = freezed,
  }) {
    return _then(_value.copyWith(
      categoryNames: categoryNames == freezed
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<CategoryArticles>,
      currentTabIndex: currentTabIndex == freezed
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(
          _NewsState value, $Res Function(_NewsState) then) =
      __$NewsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> categoryNames,
      List<CategoryArticles> articles,
      int currentTabIndex});
}

/// @nodoc
class __$NewsStateCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements _$NewsStateCopyWith<$Res> {
  __$NewsStateCopyWithImpl(_NewsState _value, $Res Function(_NewsState) _then)
      : super(_value, (v) => _then(v as _NewsState));

  @override
  _NewsState get _value => super._value as _NewsState;

  @override
  $Res call({
    Object? categoryNames = freezed,
    Object? articles = freezed,
    Object? currentTabIndex = freezed,
  }) {
    return _then(_NewsState(
      categoryNames: categoryNames == freezed
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<CategoryArticles>,
      currentTabIndex: currentTabIndex == freezed
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_NewsState extends _NewsState {
  _$_NewsState(
      {required this.categoryNames,
      required this.articles,
      required this.currentTabIndex})
      : super._();

  factory _$_NewsState.fromJson(Map<String, dynamic> json) =>
      _$_$_NewsStateFromJson(json);

  @override
  final List<String> categoryNames;
  @override
  final List<CategoryArticles> articles;
  @override
  final int currentTabIndex;

  @override
  String toString() {
    return 'NewsState(categoryNames: $categoryNames, articles: $articles, currentTabIndex: $currentTabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewsState &&
            (identical(other.categoryNames, categoryNames) ||
                const DeepCollectionEquality()
                    .equals(other.categoryNames, categoryNames)) &&
            (identical(other.articles, articles) ||
                const DeepCollectionEquality()
                    .equals(other.articles, articles)) &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentTabIndex, currentTabIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryNames) ^
      const DeepCollectionEquality().hash(articles) ^
      const DeepCollectionEquality().hash(currentTabIndex);

  @JsonKey(ignore: true)
  @override
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      __$NewsStateCopyWithImpl<_NewsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NewsStateToJson(this);
  }
}

abstract class _NewsState extends NewsState {
  factory _NewsState(
      {required List<String> categoryNames,
      required List<CategoryArticles> articles,
      required int currentTabIndex}) = _$_NewsState;
  _NewsState._() : super._();

  factory _NewsState.fromJson(Map<String, dynamic> json) =
      _$_NewsState.fromJson;

  @override
  List<String> get categoryNames => throw _privateConstructorUsedError;
  @override
  List<CategoryArticles> get articles => throw _privateConstructorUsedError;
  @override
  int get currentTabIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
