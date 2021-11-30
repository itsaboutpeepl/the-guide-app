// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageState _$HomePageStateFromJson(Map<String, dynamic> json) {
  return _HomePageState.fromJson(json);
}

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

  _HomePageState call(
      {required List<BlogArticle> featuredPosts,
      required List<VideoArticle> featuredVideos,
      required List<Events> eventList,
      required List<Directory> directoryList,
      required bool playConfetti}) {
    return _HomePageState(
      featuredPosts: featuredPosts,
      featuredVideos: featuredVideos,
      eventList: eventList,
      directoryList: directoryList,
      playConfetti: playConfetti,
    );
  }

  HomePageState fromJson(Map<String, Object> json) {
    return HomePageState.fromJson(json);
  }
}

/// @nodoc
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {
  List<BlogArticle> get featuredPosts => throw _privateConstructorUsedError;
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;
  List<Events> get eventList => throw _privateConstructorUsedError;
  List<Directory> get directoryList => throw _privateConstructorUsedError;
  bool get playConfetti => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
  $Res call(
      {List<BlogArticle> featuredPosts,
      List<VideoArticle> featuredVideos,
      List<Events> eventList,
      List<Directory> directoryList,
      bool playConfetti});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;

  @override
  $Res call({
    Object? featuredPosts = freezed,
    Object? featuredVideos = freezed,
    Object? eventList = freezed,
    Object? directoryList = freezed,
    Object? playConfetti = freezed,
  }) {
    return _then(_value.copyWith(
      featuredPosts: featuredPosts == freezed
          ? _value.featuredPosts
          : featuredPosts // ignore: cast_nullable_to_non_nullable
              as List<BlogArticle>,
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
      playConfetti: playConfetti == freezed
          ? _value.playConfetti
          : playConfetti // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(
          _HomePageState value, $Res Function(_HomePageState) then) =
      __$HomePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BlogArticle> featuredPosts,
      List<VideoArticle> featuredVideos,
      List<Events> eventList,
      List<Directory> directoryList,
      bool playConfetti});
}

/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(
      _HomePageState _value, $Res Function(_HomePageState) _then)
      : super(_value, (v) => _then(v as _HomePageState));

  @override
  _HomePageState get _value => super._value as _HomePageState;

  @override
  $Res call({
    Object? featuredPosts = freezed,
    Object? featuredVideos = freezed,
    Object? eventList = freezed,
    Object? directoryList = freezed,
    Object? playConfetti = freezed,
  }) {
    return _then(_HomePageState(
      featuredPosts: featuredPosts == freezed
          ? _value.featuredPosts
          : featuredPosts // ignore: cast_nullable_to_non_nullable
              as List<BlogArticle>,
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
      playConfetti: playConfetti == freezed
          ? _value.playConfetti
          : playConfetti // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_HomePageState extends _HomePageState {
  _$_HomePageState(
      {required this.featuredPosts,
      required this.featuredVideos,
      required this.eventList,
      required this.directoryList,
      required this.playConfetti})
      : super._();

  factory _$_HomePageState.fromJson(Map<String, dynamic> json) =>
      _$_$_HomePageStateFromJson(json);

  @override
  final List<BlogArticle> featuredPosts;
  @override
  final List<VideoArticle> featuredVideos;
  @override
  final List<Events> eventList;
  @override
  final List<Directory> directoryList;
  @override
  final bool playConfetti;

  @override
  String toString() {
    return 'HomePageState(featuredPosts: $featuredPosts, featuredVideos: $featuredVideos, eventList: $eventList, directoryList: $directoryList, playConfetti: $playConfetti)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomePageState &&
            (identical(other.featuredPosts, featuredPosts) ||
                const DeepCollectionEquality()
                    .equals(other.featuredPosts, featuredPosts)) &&
            (identical(other.featuredVideos, featuredVideos) ||
                const DeepCollectionEquality()
                    .equals(other.featuredVideos, featuredVideos)) &&
            (identical(other.eventList, eventList) ||
                const DeepCollectionEquality()
                    .equals(other.eventList, eventList)) &&
            (identical(other.directoryList, directoryList) ||
                const DeepCollectionEquality()
                    .equals(other.directoryList, directoryList)) &&
            (identical(other.playConfetti, playConfetti) ||
                const DeepCollectionEquality()
                    .equals(other.playConfetti, playConfetti)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(featuredPosts) ^
      const DeepCollectionEquality().hash(featuredVideos) ^
      const DeepCollectionEquality().hash(eventList) ^
      const DeepCollectionEquality().hash(directoryList) ^
      const DeepCollectionEquality().hash(playConfetti);

  @JsonKey(ignore: true)
  @override
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomePageStateToJson(this);
  }
}

abstract class _HomePageState extends HomePageState {
  factory _HomePageState(
      {required List<BlogArticle> featuredPosts,
      required List<VideoArticle> featuredVideos,
      required List<Events> eventList,
      required List<Directory> directoryList,
      required bool playConfetti}) = _$_HomePageState;
  _HomePageState._() : super._();

  factory _HomePageState.fromJson(Map<String, dynamic> json) =
      _$_HomePageState.fromJson;

  @override
  List<BlogArticle> get featuredPosts => throw _privateConstructorUsedError;
  @override
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;
  @override
  List<Events> get eventList => throw _privateConstructorUsedError;
  @override
  List<Directory> get directoryList => throw _privateConstructorUsedError;
  @override
  bool get playConfetti => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
