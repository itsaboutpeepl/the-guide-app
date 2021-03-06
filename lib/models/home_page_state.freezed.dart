// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageState _$HomePageStateFromJson(Map<String, dynamic> json) {
  return _HomePageState.fromJson(json);
}

/// @nodoc
mixin _$HomePageState {
  List<BlogArticle> get featuredPosts => throw _privateConstructorUsedError;
  List<VideoArticle> get featuredVideos => throw _privateConstructorUsedError;
  List<Events> get eventList => throw _privateConstructorUsedError;
  List<Directory> get directoryList => throw _privateConstructorUsedError;
  bool get playConfetti => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

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
      bool playConfetti,
      bool isLoading,
      bool isError});
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
    Object? isLoading = freezed,
    Object? isError = freezed,
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
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BlogArticle> featuredPosts,
      List<VideoArticle> featuredVideos,
      List<Events> eventList,
      List<Directory> directoryList,
      bool playConfetti,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, (v) => _then(v as _$_HomePageState));

  @override
  _$_HomePageState get _value => super._value as _$_HomePageState;

  @override
  $Res call({
    Object? featuredPosts = freezed,
    Object? featuredVideos = freezed,
    Object? eventList = freezed,
    Object? directoryList = freezed,
    Object? playConfetti = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_$_HomePageState(
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
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
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
      required this.playConfetti,
      required this.isLoading,
      required this.isError})
      : super._();

  factory _$_HomePageState.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageStateFromJson(json);

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
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomePageState(featuredPosts: $featuredPosts, featuredVideos: $featuredVideos, eventList: $eventList, directoryList: $directoryList, playConfetti: $playConfetti, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            const DeepCollectionEquality()
                .equals(other.featuredPosts, featuredPosts) &&
            const DeepCollectionEquality()
                .equals(other.featuredVideos, featuredVideos) &&
            const DeepCollectionEquality().equals(other.eventList, eventList) &&
            const DeepCollectionEquality()
                .equals(other.directoryList, directoryList) &&
            const DeepCollectionEquality()
                .equals(other.playConfetti, playConfetti) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(featuredPosts),
      const DeepCollectionEquality().hash(featuredVideos),
      const DeepCollectionEquality().hash(eventList),
      const DeepCollectionEquality().hash(directoryList),
      const DeepCollectionEquality().hash(playConfetti),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError));

  @JsonKey(ignore: true)
  @override
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageStateToJson(this);
  }
}

abstract class _HomePageState extends HomePageState {
  factory _HomePageState(
      {required final List<BlogArticle> featuredPosts,
      required final List<VideoArticle> featuredVideos,
      required final List<Events> eventList,
      required final List<Directory> directoryList,
      required final bool playConfetti,
      required final bool isLoading,
      required final bool isError}) = _$_HomePageState;
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
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
