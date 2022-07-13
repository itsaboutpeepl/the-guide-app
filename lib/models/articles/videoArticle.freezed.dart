// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'videoArticle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoArticle _$VideoArticleFromJson(Map<String, dynamic> json) {
  return _VideoArticle.fromJson(json);
}

/// @nodoc
mixin _$VideoArticle {
  String get title => throw _privateConstructorUsedError;
  String get placeholderImageURL => throw _privateConstructorUsedError;
  String get videoURL => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;
  int get rewardAmount => throw _privateConstructorUsedError;
  String get postID => throw _privateConstructorUsedError;
  String get postURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoArticleCopyWith<VideoArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoArticleCopyWith<$Res> {
  factory $VideoArticleCopyWith(
          VideoArticle value, $Res Function(VideoArticle) then) =
      _$VideoArticleCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String placeholderImageURL,
      String videoURL,
      List<String> category,
      int rewardAmount,
      String postID,
      String postURL});
}

/// @nodoc
class _$VideoArticleCopyWithImpl<$Res> implements $VideoArticleCopyWith<$Res> {
  _$VideoArticleCopyWithImpl(this._value, this._then);

  final VideoArticle _value;
  // ignore: unused_field
  final $Res Function(VideoArticle) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? placeholderImageURL = freezed,
    Object? videoURL = freezed,
    Object? category = freezed,
    Object? rewardAmount = freezed,
    Object? postID = freezed,
    Object? postURL = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      placeholderImageURL: placeholderImageURL == freezed
          ? _value.placeholderImageURL
          : placeholderImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      videoURL: videoURL == freezed
          ? _value.videoURL
          : videoURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rewardAmount: rewardAmount == freezed
          ? _value.rewardAmount
          : rewardAmount // ignore: cast_nullable_to_non_nullable
              as int,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      postURL: postURL == freezed
          ? _value.postURL
          : postURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_VideoArticleCopyWith<$Res>
    implements $VideoArticleCopyWith<$Res> {
  factory _$$_VideoArticleCopyWith(
          _$_VideoArticle value, $Res Function(_$_VideoArticle) then) =
      __$$_VideoArticleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String placeholderImageURL,
      String videoURL,
      List<String> category,
      int rewardAmount,
      String postID,
      String postURL});
}

/// @nodoc
class __$$_VideoArticleCopyWithImpl<$Res>
    extends _$VideoArticleCopyWithImpl<$Res>
    implements _$$_VideoArticleCopyWith<$Res> {
  __$$_VideoArticleCopyWithImpl(
      _$_VideoArticle _value, $Res Function(_$_VideoArticle) _then)
      : super(_value, (v) => _then(v as _$_VideoArticle));

  @override
  _$_VideoArticle get _value => super._value as _$_VideoArticle;

  @override
  $Res call({
    Object? title = freezed,
    Object? placeholderImageURL = freezed,
    Object? videoURL = freezed,
    Object? category = freezed,
    Object? rewardAmount = freezed,
    Object? postID = freezed,
    Object? postURL = freezed,
  }) {
    return _then(_$_VideoArticle(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      placeholderImageURL: placeholderImageURL == freezed
          ? _value.placeholderImageURL
          : placeholderImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      videoURL: videoURL == freezed
          ? _value.videoURL
          : videoURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rewardAmount: rewardAmount == freezed
          ? _value.rewardAmount
          : rewardAmount // ignore: cast_nullable_to_non_nullable
              as int,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      postURL: postURL == freezed
          ? _value.postURL
          : postURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VideoArticle extends _VideoArticle {
  _$_VideoArticle(
      {required this.title,
      required this.placeholderImageURL,
      required this.videoURL,
      required final List<String> category,
      required this.rewardAmount,
      required this.postID,
      required this.postURL})
      : _category = category,
        super._();

  factory _$_VideoArticle.fromJson(Map<String, dynamic> json) =>
      _$$_VideoArticleFromJson(json);

  @override
  final String title;
  @override
  final String placeholderImageURL;
  @override
  final String videoURL;
  final List<String> _category;
  @override
  List<String> get category {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  @override
  final int rewardAmount;
  @override
  final String postID;
  @override
  final String postURL;

  @override
  String toString() {
    return 'VideoArticle(title: $title, placeholderImageURL: $placeholderImageURL, videoURL: $videoURL, category: $category, rewardAmount: $rewardAmount, postID: $postID, postURL: $postURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoArticle &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.placeholderImageURL, placeholderImageURL) &&
            const DeepCollectionEquality().equals(other.videoURL, videoURL) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality()
                .equals(other.rewardAmount, rewardAmount) &&
            const DeepCollectionEquality().equals(other.postID, postID) &&
            const DeepCollectionEquality().equals(other.postURL, postURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(placeholderImageURL),
      const DeepCollectionEquality().hash(videoURL),
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(rewardAmount),
      const DeepCollectionEquality().hash(postID),
      const DeepCollectionEquality().hash(postURL));

  @JsonKey(ignore: true)
  @override
  _$$_VideoArticleCopyWith<_$_VideoArticle> get copyWith =>
      __$$_VideoArticleCopyWithImpl<_$_VideoArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoArticleToJson(this);
  }
}

abstract class _VideoArticle extends VideoArticle {
  factory _VideoArticle(
      {required final String title,
      required final String placeholderImageURL,
      required final String videoURL,
      required final List<String> category,
      required final int rewardAmount,
      required final String postID,
      required final String postURL}) = _$_VideoArticle;
  _VideoArticle._() : super._();

  factory _VideoArticle.fromJson(Map<String, dynamic> json) =
      _$_VideoArticle.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get placeholderImageURL => throw _privateConstructorUsedError;
  @override
  String get videoURL => throw _privateConstructorUsedError;
  @override
  List<String> get category => throw _privateConstructorUsedError;
  @override
  int get rewardAmount => throw _privateConstructorUsedError;
  @override
  String get postID => throw _privateConstructorUsedError;
  @override
  String get postURL => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VideoArticleCopyWith<_$_VideoArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
