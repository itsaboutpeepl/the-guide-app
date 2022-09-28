// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$BlogArticleCopyWithImpl<$Res>;
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
    Object? content = freezed,
    Object? publishedAt = freezed,
    Object? gallery = freezed,
    Object? description = freezed,
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
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gallery: gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BlogArticleCopyWith<$Res>
    implements $BlogArticleCopyWith<$Res> {
  factory _$$_BlogArticleCopyWith(
          _$_BlogArticle value, $Res Function(_$_BlogArticle) then) =
      __$$_BlogArticleCopyWithImpl<$Res>;
  @override
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
class __$$_BlogArticleCopyWithImpl<$Res> extends _$BlogArticleCopyWithImpl<$Res>
    implements _$$_BlogArticleCopyWith<$Res> {
  __$$_BlogArticleCopyWithImpl(
      _$_BlogArticle _value, $Res Function(_$_BlogArticle) _then)
      : super(_value, (v) => _then(v as _$_BlogArticle));

  @override
  _$_BlogArticle get _value => super._value as _$_BlogArticle;

  @override
  $Res call({
    Object? title = freezed,
    Object? imageURL = freezed,
    Object? category = freezed,
    Object? postID = freezed,
    Object? postURL = freezed,
    Object? content = freezed,
    Object? publishedAt = freezed,
    Object? gallery = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_BlogArticle(
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
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gallery: gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
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
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.postID, postID) &&
            const DeepCollectionEquality().equals(other.postURL, postURL) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.publishedAt, publishedAt) &&
            const DeepCollectionEquality().equals(other.gallery, gallery) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(postID),
      const DeepCollectionEquality().hash(postURL),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(publishedAt),
      const DeepCollectionEquality().hash(gallery),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
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
