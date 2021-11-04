// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'blogArticle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlogArticle _$BlogArticleFromJson(Map<String, dynamic> json) {
  return _BlogArticle.fromJson(json);
}

/// @nodoc
class _$BlogArticleTearOff {
  const _$BlogArticleTearOff();

  _BlogArticle call(
      {required String title,
      required String imageURL,
      required List<String> category,
      required int postID,
      required String postURL}) {
    return _BlogArticle(
      title: title,
      imageURL: imageURL,
      category: category,
      postID: postID,
      postURL: postURL,
    );
  }

  BlogArticle fromJson(Map<String, Object> json) {
    return BlogArticle.fromJson(json);
  }
}

/// @nodoc
const $BlogArticle = _$BlogArticleTearOff();

/// @nodoc
mixin _$BlogArticle {
  String get title => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;
  int get postID => throw _privateConstructorUsedError;
  String get postURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogArticleCopyWith<BlogArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogArticleCopyWith<$Res> {
  factory $BlogArticleCopyWith(
          BlogArticle value, $Res Function(BlogArticle) then) =
      _$BlogArticleCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String imageURL,
      List<String> category,
      int postID,
      String postURL});
}

/// @nodoc
class _$BlogArticleCopyWithImpl<$Res> implements $BlogArticleCopyWith<$Res> {
  _$BlogArticleCopyWithImpl(this._value, this._then);

  final BlogArticle _value;
  // ignore: unused_field
  final $Res Function(BlogArticle) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? postID = freezed,
    Object? postURL = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as int,
      postURL: postURL == freezed
          ? _value.postURL
          : postURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BlogArticleCopyWith<$Res>
    implements $BlogArticleCopyWith<$Res> {
  factory _$BlogArticleCopyWith(
          _BlogArticle value, $Res Function(_BlogArticle) then) =
      __$BlogArticleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String imageURL,
      List<String> category,
      int postID,
      String postURL});
}

/// @nodoc
class __$BlogArticleCopyWithImpl<$Res> extends _$BlogArticleCopyWithImpl<$Res>
    implements _$BlogArticleCopyWith<$Res> {
  __$BlogArticleCopyWithImpl(
      _BlogArticle _value, $Res Function(_BlogArticle) _then)
      : super(_value, (v) => _then(v as _BlogArticle));

  @override
  _BlogArticle get _value => super._value as _BlogArticle;

  @override
  $Res call({
    Object? title = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? postID = freezed,
    Object? postURL = freezed,
  }) {
    return _then(_BlogArticle(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as int,
      postURL: postURL == freezed
          ? _value.postURL
          : postURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_BlogArticle extends _BlogArticle {
  _$_BlogArticle(
      {required this.title,
      required this.imageURL,
      required this.category,
      required this.postID,
      required this.postURL})
      : super._();

  factory _$_BlogArticle.fromJson(Map<String, dynamic> json) =>
      _$_$_BlogArticleFromJson(json);

  @override
  final String title;
  @override
  final String imageURL;
  @override
  final List<String> category;
  @override
  final int postID;
  @override
  final String postURL;

  @override
  String toString() {
    return 'BlogArticle(title: $title, imageURL: $imageURL, category: $category, postID: $postID, postURL: $postURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlogArticle &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.postID, postID) ||
                const DeepCollectionEquality().equals(other.postID, postID)) &&
            (identical(other.postURL, postURL) ||
                const DeepCollectionEquality().equals(other.postURL, postURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(postID) ^
      const DeepCollectionEquality().hash(postURL);

  @JsonKey(ignore: true)
  @override
  _$BlogArticleCopyWith<_BlogArticle> get copyWith =>
      __$BlogArticleCopyWithImpl<_BlogArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BlogArticleToJson(this);
  }
}

abstract class _BlogArticle extends BlogArticle {
  factory _BlogArticle(
      {required String title,
      required String imageURL,
      required List<String> category,
      required int postID,
      required String postURL}) = _$_BlogArticle;
  _BlogArticle._() : super._();

  factory _BlogArticle.fromJson(Map<String, dynamic> json) =
      _$_BlogArticle.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get imageURL => throw _privateConstructorUsedError;
  @override
  List<String> get category => throw _privateConstructorUsedError;
  @override
  int get postID => throw _privateConstructorUsedError;
  @override
  String get postURL => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BlogArticleCopyWith<_BlogArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
