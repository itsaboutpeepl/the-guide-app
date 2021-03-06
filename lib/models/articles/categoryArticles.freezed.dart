// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categoryArticles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryArticles _$CategoryArticlesFromJson(Map<String, dynamic> json) {
  return _CategoryArticles.fromJson(json);
}

/// @nodoc
mixin _$CategoryArticles {
  Category get category => throw _privateConstructorUsedError;
  List<BlogArticle> get articleList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryArticlesCopyWith<CategoryArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryArticlesCopyWith<$Res> {
  factory $CategoryArticlesCopyWith(
          CategoryArticles value, $Res Function(CategoryArticles) then) =
      _$CategoryArticlesCopyWithImpl<$Res>;
  $Res call({Category category, List<BlogArticle> articleList});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryArticlesCopyWithImpl<$Res>
    implements $CategoryArticlesCopyWith<$Res> {
  _$CategoryArticlesCopyWithImpl(this._value, this._then);

  final CategoryArticles _value;
  // ignore: unused_field
  final $Res Function(CategoryArticles) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? articleList = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      articleList: articleList == freezed
          ? _value.articleList
          : articleList // ignore: cast_nullable_to_non_nullable
              as List<BlogArticle>,
    ));
  }

  @override
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$$_CategoryArticlesCopyWith<$Res>
    implements $CategoryArticlesCopyWith<$Res> {
  factory _$$_CategoryArticlesCopyWith(
          _$_CategoryArticles value, $Res Function(_$_CategoryArticles) then) =
      __$$_CategoryArticlesCopyWithImpl<$Res>;
  @override
  $Res call({Category category, List<BlogArticle> articleList});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_CategoryArticlesCopyWithImpl<$Res>
    extends _$CategoryArticlesCopyWithImpl<$Res>
    implements _$$_CategoryArticlesCopyWith<$Res> {
  __$$_CategoryArticlesCopyWithImpl(
      _$_CategoryArticles _value, $Res Function(_$_CategoryArticles) _then)
      : super(_value, (v) => _then(v as _$_CategoryArticles));

  @override
  _$_CategoryArticles get _value => super._value as _$_CategoryArticles;

  @override
  $Res call({
    Object? category = freezed,
    Object? articleList = freezed,
  }) {
    return _then(_$_CategoryArticles(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      articleList: articleList == freezed
          ? _value.articleList
          : articleList // ignore: cast_nullable_to_non_nullable
              as List<BlogArticle>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_CategoryArticles extends _CategoryArticles {
  _$_CategoryArticles({required this.category, required this.articleList})
      : super._();

  factory _$_CategoryArticles.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryArticlesFromJson(json);

  @override
  final Category category;
  @override
  final List<BlogArticle> articleList;

  @override
  String toString() {
    return 'CategoryArticles(category: $category, articleList: $articleList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryArticles &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.articleList, articleList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(articleList));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryArticlesCopyWith<_$_CategoryArticles> get copyWith =>
      __$$_CategoryArticlesCopyWithImpl<_$_CategoryArticles>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryArticlesToJson(this);
  }
}

abstract class _CategoryArticles extends CategoryArticles {
  factory _CategoryArticles(
      {required final Category category,
      required final List<BlogArticle> articleList}) = _$_CategoryArticles;
  _CategoryArticles._() : super._();

  factory _CategoryArticles.fromJson(Map<String, dynamic> json) =
      _$_CategoryArticles.fromJson;

  @override
  Category get category => throw _privateConstructorUsedError;
  @override
  List<BlogArticle> get articleList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryArticlesCopyWith<_$_CategoryArticles> get copyWith =>
      throw _privateConstructorUsedError;
}
