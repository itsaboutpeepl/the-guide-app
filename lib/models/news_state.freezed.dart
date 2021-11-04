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
      {required BlogArticle featuredPost,
      required List<BlogArticle> listOfRecommendedArticles,
      required List<String> categoryNames,
      required List<CategoryArticles> categoryArticles,
      required List<VideoArticle> featuredVideos}) {
    return _NewsState(
      featuredPost: featuredPost,
      listOfRecommendedArticles: listOfRecommendedArticles,
      categoryNames: categoryNames,
      categoryArticles: categoryArticles,
      featuredVideos: featuredVideos,
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
  BlogArticle get featuredPost => throw _privateConstructorUsedError;
  List<BlogArticle> get listOfRecommendedArticles =>
      throw _privateConstructorUsedError;
  List<String> get categoryNames => throw _privateConstructorUsedError;
  List<CategoryArticles> get categoryArticles =>
      throw _privateConstructorUsedError;
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;

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
      {BlogArticle featuredPost,
      List<BlogArticle> listOfRecommendedArticles,
      List<String> categoryNames,
      List<CategoryArticles> categoryArticles,
      List<VideoArticle> featuredVideos});

  $BlogArticleCopyWith<$Res> get featuredPost;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;

  @override
  $Res call({
    Object? featuredPost = freezed,
    Object? listOfRecommendedArticles = freezed,
    Object? categoryNames = freezed,
    Object? categoryArticles = freezed,
    Object? featuredVideos = freezed,
  }) {
    return _then(_value.copyWith(
      featuredPost: featuredPost == freezed
          ? _value.featuredPost
          : featuredPost // ignore: cast_nullable_to_non_nullable
              as BlogArticle,
      listOfRecommendedArticles: listOfRecommendedArticles == freezed
          ? _value.listOfRecommendedArticles
          : listOfRecommendedArticles // ignore: cast_nullable_to_non_nullable
              as List<BlogArticle>,
      categoryNames: categoryNames == freezed
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryArticles: categoryArticles == freezed
          ? _value.categoryArticles
          : categoryArticles // ignore: cast_nullable_to_non_nullable
              as List<CategoryArticles>,
      featuredVideos: featuredVideos == freezed
          ? _value.featuredVideos
          : featuredVideos // ignore: cast_nullable_to_non_nullable
              as List<VideoArticle>,
    ));
  }

  @override
  $BlogArticleCopyWith<$Res> get featuredPost {
    return $BlogArticleCopyWith<$Res>(_value.featuredPost, (value) {
      return _then(_value.copyWith(featuredPost: value));
    });
  }
}

/// @nodoc
abstract class _$NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(
          _NewsState value, $Res Function(_NewsState) then) =
      __$NewsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {BlogArticle featuredPost,
      List<BlogArticle> listOfRecommendedArticles,
      List<String> categoryNames,
      List<CategoryArticles> categoryArticles,
      List<VideoArticle> featuredVideos});

  @override
  $BlogArticleCopyWith<$Res> get featuredPost;
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
    Object? featuredPost = freezed,
    Object? listOfRecommendedArticles = freezed,
    Object? categoryNames = freezed,
    Object? categoryArticles = freezed,
    Object? featuredVideos = freezed,
  }) {
    return _then(_NewsState(
      featuredPost: featuredPost == freezed
          ? _value.featuredPost
          : featuredPost // ignore: cast_nullable_to_non_nullable
              as BlogArticle,
      listOfRecommendedArticles: listOfRecommendedArticles == freezed
          ? _value.listOfRecommendedArticles
          : listOfRecommendedArticles // ignore: cast_nullable_to_non_nullable
              as List<BlogArticle>,
      categoryNames: categoryNames == freezed
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryArticles: categoryArticles == freezed
          ? _value.categoryArticles
          : categoryArticles // ignore: cast_nullable_to_non_nullable
              as List<CategoryArticles>,
      featuredVideos: featuredVideos == freezed
          ? _value.featuredVideos
          : featuredVideos // ignore: cast_nullable_to_non_nullable
              as List<VideoArticle>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_NewsState extends _NewsState {
  _$_NewsState(
      {required this.featuredPost,
      required this.listOfRecommendedArticles,
      required this.categoryNames,
      required this.categoryArticles,
      required this.featuredVideos})
      : super._();

  factory _$_NewsState.fromJson(Map<String, dynamic> json) =>
      _$_$_NewsStateFromJson(json);

  @override
  final BlogArticle featuredPost;
  @override
  final List<BlogArticle> listOfRecommendedArticles;
  @override
  final List<String> categoryNames;
  @override
  final List<CategoryArticles> categoryArticles;
  @override
  final List<VideoArticle> featuredVideos;

  @override
  String toString() {
    return 'NewsState(featuredPost: $featuredPost, listOfRecommendedArticles: $listOfRecommendedArticles, categoryNames: $categoryNames, categoryArticles: $categoryArticles, featuredVideos: $featuredVideos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewsState &&
            (identical(other.featuredPost, featuredPost) ||
                const DeepCollectionEquality()
                    .equals(other.featuredPost, featuredPost)) &&
            (identical(other.listOfRecommendedArticles,
                    listOfRecommendedArticles) ||
                const DeepCollectionEquality().equals(
                    other.listOfRecommendedArticles,
                    listOfRecommendedArticles)) &&
            (identical(other.categoryNames, categoryNames) ||
                const DeepCollectionEquality()
                    .equals(other.categoryNames, categoryNames)) &&
            (identical(other.categoryArticles, categoryArticles) ||
                const DeepCollectionEquality()
                    .equals(other.categoryArticles, categoryArticles)) &&
            (identical(other.featuredVideos, featuredVideos) ||
                const DeepCollectionEquality()
                    .equals(other.featuredVideos, featuredVideos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(featuredPost) ^
      const DeepCollectionEquality().hash(listOfRecommendedArticles) ^
      const DeepCollectionEquality().hash(categoryNames) ^
      const DeepCollectionEquality().hash(categoryArticles) ^
      const DeepCollectionEquality().hash(featuredVideos);

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
      {required BlogArticle featuredPost,
      required List<BlogArticle> listOfRecommendedArticles,
      required List<String> categoryNames,
      required List<CategoryArticles> categoryArticles,
      required List<VideoArticle> featuredVideos}) = _$_NewsState;
  _NewsState._() : super._();

  factory _NewsState.fromJson(Map<String, dynamic> json) =
      _$_NewsState.fromJson;

  @override
  BlogArticle get featuredPost => throw _privateConstructorUsedError;
  @override
  List<BlogArticle> get listOfRecommendedArticles =>
      throw _privateConstructorUsedError;
  @override
  List<String> get categoryNames => throw _privateConstructorUsedError;
  @override
  List<CategoryArticles> get categoryArticles =>
      throw _privateConstructorUsedError;
  @override
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
