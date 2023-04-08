// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blogArticle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlogArticle _$BlogArticleFromJson(Map<String, dynamic> json) {
  return _BlogArticle.fromJson(json);
}

/// @nodoc
mixin _$BlogArticle {
  String get title => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;
  int get postID => throw _privateConstructorUsedError;
  String get postURL => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  List<String> get gallery => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogArticleCopyWith<BlogArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogArticleCopyWith<$Res> {
  factory $BlogArticleCopyWith(
          BlogArticle value, $Res Function(BlogArticle) then) =
      _$BlogArticleCopyWithImpl<$Res, BlogArticle>;
  @useResult
  $Res call(
      {String title,
      String imageURL,
      List<String> category,
      int postID,
      String postURL,
      String content,
      DateTime publishedAt,
      List<String> gallery,
      String description});
}

/// @nodoc
class _$BlogArticleCopyWithImpl<$Res, $Val extends BlogArticle>
    implements $BlogArticleCopyWith<$Res> {
  _$BlogArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imageURL = null,
    Object? category = null,
    Object? postID = null,
    Object? postURL = null,
    Object? content = null,
    Object? publishedAt = null,
    Object? gallery = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as int,
      postURL: null == postURL
          ? _value.postURL
          : postURL // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gallery: null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlogArticleCopyWith<$Res>
    implements $BlogArticleCopyWith<$Res> {
  factory _$$_BlogArticleCopyWith(
          _$_BlogArticle value, $Res Function(_$_BlogArticle) then) =
      __$$_BlogArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String imageURL,
      List<String> category,
      int postID,
      String postURL,
      String content,
      DateTime publishedAt,
      List<String> gallery,
      String description});
}

/// @nodoc
class __$$_BlogArticleCopyWithImpl<$Res>
    extends _$BlogArticleCopyWithImpl<$Res, _$_BlogArticle>
    implements _$$_BlogArticleCopyWith<$Res> {
  __$$_BlogArticleCopyWithImpl(
      _$_BlogArticle _value, $Res Function(_$_BlogArticle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imageURL = null,
    Object? category = null,
    Object? postID = null,
    Object? postURL = null,
    Object? content = null,
    Object? publishedAt = null,
    Object? gallery = null,
    Object? description = null,
  }) {
    return _then(_$_BlogArticle(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as int,
      postURL: null == postURL
          ? _value.postURL
          : postURL // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gallery: null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      required this.postURL,
      required this.content,
      required this.publishedAt,
      required this.gallery,
      required this.description})
      : super._();

  factory _$_BlogArticle.fromJson(Map<String, dynamic> json) =>
      _$$_BlogArticleFromJson(json);

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
  final String content;
  @override
  final DateTime publishedAt;
  @override
  final List<String> gallery;
  @override
  final String description;

  @override
  String toString() {
    return 'BlogArticle(title: $title, imageURL: $imageURL, category: $category, postID: $postID, postURL: $postURL, content: $content, publishedAt: $publishedAt, gallery: $gallery, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlogArticle &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.postURL, postURL) || other.postURL == postURL) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            const DeepCollectionEquality().equals(other.gallery, gallery) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      imageURL,
      const DeepCollectionEquality().hash(category),
      postID,
      postURL,
      content,
      publishedAt,
      const DeepCollectionEquality().hash(gallery),
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlogArticleCopyWith<_$_BlogArticle> get copyWith =>
      __$$_BlogArticleCopyWithImpl<_$_BlogArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlogArticleToJson(
      this,
    );
  }
}

abstract class _BlogArticle extends BlogArticle {
  factory _BlogArticle(
      {required final String title,
      required final String imageURL,
      required final List<String> category,
      required final int postID,
      required final String postURL,
      required final String content,
      required final DateTime publishedAt,
      required final List<String> gallery,
      required final String description}) = _$_BlogArticle;
  _BlogArticle._() : super._();

  factory _BlogArticle.fromJson(Map<String, dynamic> json) =
      _$_BlogArticle.fromJson;

  @override
  String get title;
  @override
  String get imageURL;
  @override
  List<String> get category;
  @override
  int get postID;
  @override
  String get postURL;
  @override
  String get content;
  @override
  DateTime get publishedAt;
  @override
  List<String> get gallery;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_BlogArticleCopyWith<_$_BlogArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
