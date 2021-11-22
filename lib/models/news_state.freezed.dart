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
      {required List<BlogArticle> featuredPosts,
      required List<String> categoryNames,
      required List<CategoryArticles> categoryArticles,
      required List<VideoArticle> featuredVideos,
      required List<Events> eventList,
      required List<Directory> directoryList}) {
    return _NewsState(
      featuredPosts: featuredPosts,
      categoryNames: categoryNames,
      categoryArticles: categoryArticles,
      featuredVideos: featuredVideos,
      eventList: eventList,
      directoryList: directoryList,
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
  List<BlogArticle> get featuredPosts => throw _privateConstructorUsedError;
  List<String> get categoryNames => throw _privateConstructorUsedError;
  List<CategoryArticles> get categoryArticles =>
      throw _privateConstructorUsedError;
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;
  List<Events> get eventList => throw _privateConstructorUsedError;
  List<Directory> get directoryList => throw _privateConstructorUsedError;

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
      {List<BlogArticle> featuredPosts,
      List<String> categoryNames,
      List<CategoryArticles> categoryArticles,
      List<VideoArticle> featuredVideos,
      List<Events> eventList,
      List<Directory> directoryList});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;

  @override
  $Res call({
    Object? featuredPosts = freezed,
    Object? categoryNames = freezed,
    Object? categoryArticles = freezed,
    Object? featuredVideos = freezed,
    Object? eventList = freezed,
    Object? directoryList = freezed,
  }) {
    return _then(_value.copyWith(
      featuredPosts: featuredPosts == freezed
          ? _value.featuredPosts
          : featuredPosts // ignore: cast_nullable_to_non_nullable
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
      eventList: eventList == freezed
          ? _value.eventList
          : eventList // ignore: cast_nullable_to_non_nullable
              as List<Events>,
      directoryList: directoryList == freezed
          ? _value.directoryList
          : directoryList // ignore: cast_nullable_to_non_nullable
              as List<Directory>,
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
      {List<BlogArticle> featuredPosts,
      List<String> categoryNames,
      List<CategoryArticles> categoryArticles,
      List<VideoArticle> featuredVideos,
      List<Events> eventList,
      List<Directory> directoryList});
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
    Object? featuredPosts = freezed,
    Object? categoryNames = freezed,
    Object? categoryArticles = freezed,
    Object? featuredVideos = freezed,
    Object? eventList = freezed,
    Object? directoryList = freezed,
  }) {
    return _then(_NewsState(
      featuredPosts: featuredPosts == freezed
          ? _value.featuredPosts
          : featuredPosts // ignore: cast_nullable_to_non_nullable
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
      eventList: eventList == freezed
          ? _value.eventList
          : eventList // ignore: cast_nullable_to_non_nullable
              as List<Events>,
      directoryList: directoryList == freezed
          ? _value.directoryList
          : directoryList // ignore: cast_nullable_to_non_nullable
              as List<Directory>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_NewsState extends _NewsState {
  _$_NewsState(
      {required this.featuredPosts,
      required this.categoryNames,
      required this.categoryArticles,
      required this.featuredVideos,
      required this.eventList,
      required this.directoryList})
      : super._();

  factory _$_NewsState.fromJson(Map<String, dynamic> json) =>
      _$_$_NewsStateFromJson(json);

  @override
  final List<BlogArticle> featuredPosts;
  @override
  final List<String> categoryNames;
  @override
  final List<CategoryArticles> categoryArticles;
  @override
  final List<VideoArticle> featuredVideos;
  @override
  final List<Events> eventList;
  @override
  final List<Directory> directoryList;

  @override
  String toString() {
    return 'NewsState(featuredPosts: $featuredPosts, categoryNames: $categoryNames, categoryArticles: $categoryArticles, featuredVideos: $featuredVideos, eventList: $eventList, directoryList: $directoryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewsState &&
            (identical(other.featuredPosts, featuredPosts) ||
                const DeepCollectionEquality()
                    .equals(other.featuredPosts, featuredPosts)) &&
            (identical(other.categoryNames, categoryNames) ||
                const DeepCollectionEquality()
                    .equals(other.categoryNames, categoryNames)) &&
            (identical(other.categoryArticles, categoryArticles) ||
                const DeepCollectionEquality()
                    .equals(other.categoryArticles, categoryArticles)) &&
            (identical(other.featuredVideos, featuredVideos) ||
                const DeepCollectionEquality()
                    .equals(other.featuredVideos, featuredVideos)) &&
            (identical(other.eventList, eventList) ||
                const DeepCollectionEquality()
                    .equals(other.eventList, eventList)) &&
            (identical(other.directoryList, directoryList) ||
                const DeepCollectionEquality()
                    .equals(other.directoryList, directoryList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(featuredPosts) ^
      const DeepCollectionEquality().hash(categoryNames) ^
      const DeepCollectionEquality().hash(categoryArticles) ^
      const DeepCollectionEquality().hash(featuredVideos) ^
      const DeepCollectionEquality().hash(eventList) ^
      const DeepCollectionEquality().hash(directoryList);

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
      {required List<BlogArticle> featuredPosts,
      required List<String> categoryNames,
      required List<CategoryArticles> categoryArticles,
      required List<VideoArticle> featuredVideos,
      required List<Events> eventList,
      required List<Directory> directoryList}) = _$_NewsState;
  _NewsState._() : super._();

  factory _NewsState.fromJson(Map<String, dynamic> json) =
      _$_NewsState.fromJson;

  @override
  List<BlogArticle> get featuredPosts => throw _privateConstructorUsedError;
  @override
  List<String> get categoryNames => throw _privateConstructorUsedError;
  @override
  List<CategoryArticles> get categoryArticles =>
      throw _privateConstructorUsedError;
  @override
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;
  @override
  List<Events> get eventList => throw _privateConstructorUsedError;
  @override
  List<Directory> get directoryList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
