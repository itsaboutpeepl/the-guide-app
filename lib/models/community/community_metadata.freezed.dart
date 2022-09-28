// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'community_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunityMetadata _$CommunityMetadataFromJson(Map<String, dynamic> json) {
  return _CommunityMetadata.fromJson(json);
}

/// @nodoc
mixin _$CommunityMetadata {
  bool get isDefaultImage => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get coverPhoto => throw _privateConstructorUsedError;
  String get coverPhotoUri => throw _privateConstructorUsedError;
  String get imageUri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityMetadataCopyWith<CommunityMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityMetadataCopyWith<$Res> {
  factory $CommunityMetadataCopyWith(
          CommunityMetadata value, $Res Function(CommunityMetadata) then) =
      _$CommunityMetadataCopyWithImpl<$Res>;
  $Res call(
      {bool isDefaultImage,
      String image,
      String coverPhoto,
      String coverPhotoUri,
      String imageUri});
}

/// @nodoc
class _$CommunityMetadataCopyWithImpl<$Res>
    implements $CommunityMetadataCopyWith<$Res> {
  _$CommunityMetadataCopyWithImpl(this._value, this._then);

  final CommunityMetadata _value;
  // ignore: unused_field
  final $Res Function(CommunityMetadata) _then;

  @override
  $Res call({
    Object? isDefaultImage = freezed,
    Object? image = freezed,
    Object? coverPhoto = freezed,
    Object? coverPhotoUri = freezed,
    Object? imageUri = freezed,
  }) {
    return _then(_value.copyWith(
      isDefaultImage: isDefaultImage == freezed
          ? _value.isDefaultImage
          : isDefaultImage // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhoto: coverPhoto == freezed
          ? _value.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhotoUri: coverPhotoUri == freezed
          ? _value.coverPhotoUri
          : coverPhotoUri // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: imageUri == freezed
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CommunityMetadataCopyWith<$Res>
    implements $CommunityMetadataCopyWith<$Res> {
  factory _$$_CommunityMetadataCopyWith(_$_CommunityMetadata value,
          $Res Function(_$_CommunityMetadata) then) =
      __$$_CommunityMetadataCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isDefaultImage,
      String image,
      String coverPhoto,
      String coverPhotoUri,
      String imageUri});
}

/// @nodoc
class __$$_CommunityMetadataCopyWithImpl<$Res>
    extends _$CommunityMetadataCopyWithImpl<$Res>
    implements _$$_CommunityMetadataCopyWith<$Res> {
  __$$_CommunityMetadataCopyWithImpl(
      _$_CommunityMetadata _value, $Res Function(_$_CommunityMetadata) _then)
      : super(_value, (v) => _then(v as _$_CommunityMetadata));

  @override
  _$_CommunityMetadata get _value => super._value as _$_CommunityMetadata;

  @override
  $Res call({
    Object? isDefaultImage = freezed,
    Object? image = freezed,
    Object? coverPhoto = freezed,
    Object? coverPhotoUri = freezed,
    Object? imageUri = freezed,
  }) {
    return _then(_$_CommunityMetadata(
      isDefaultImage: isDefaultImage == freezed
          ? _value.isDefaultImage
          : isDefaultImage // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhoto: coverPhoto == freezed
          ? _value.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhotoUri: coverPhotoUri == freezed
          ? _value.coverPhotoUri
          : coverPhotoUri // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: imageUri == freezed
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_CommunityMetadata extends _CommunityMetadata
    with DiagnosticableTreeMixin {
  _$_CommunityMetadata(
      {this.isDefaultImage = false,
      this.image = '',
      this.coverPhoto = '',
      this.coverPhotoUri = '',
      this.imageUri = ''})
      : super._();

  factory _$_CommunityMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_CommunityMetadataFromJson(json);

  @override
  @JsonKey()
  final bool isDefaultImage;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String coverPhoto;
  @override
  @JsonKey()
  final String coverPhotoUri;
  @override
  @JsonKey()
  final String imageUri;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommunityMetadata(isDefaultImage: $isDefaultImage, image: $image, coverPhoto: $coverPhoto, coverPhotoUri: $coverPhotoUri, imageUri: $imageUri)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommunityMetadata'))
      ..add(DiagnosticsProperty('isDefaultImage', isDefaultImage))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('coverPhoto', coverPhoto))
      ..add(DiagnosticsProperty('coverPhotoUri', coverPhotoUri))
      ..add(DiagnosticsProperty('imageUri', imageUri));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommunityMetadata &&
            const DeepCollectionEquality()
                .equals(other.isDefaultImage, isDefaultImage) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.coverPhoto, coverPhoto) &&
            const DeepCollectionEquality()
                .equals(other.coverPhotoUri, coverPhotoUri) &&
            const DeepCollectionEquality().equals(other.imageUri, imageUri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isDefaultImage),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(coverPhoto),
      const DeepCollectionEquality().hash(coverPhotoUri),
      const DeepCollectionEquality().hash(imageUri));

  @JsonKey(ignore: true)
  @override
  _$$_CommunityMetadataCopyWith<_$_CommunityMetadata> get copyWith =>
      __$$_CommunityMetadataCopyWithImpl<_$_CommunityMetadata>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityMetadataToJson(
      this,
    );
  }
}

abstract class _CommunityMetadata extends CommunityMetadata {
  factory _CommunityMetadata(
      {final bool isDefaultImage,
      final String image,
      final String coverPhoto,
      final String coverPhotoUri,
      final String imageUri}) = _$_CommunityMetadata;
  _CommunityMetadata._() : super._();

  factory _CommunityMetadata.fromJson(Map<String, dynamic> json) =
      _$_CommunityMetadata.fromJson;

  @override
  bool get isDefaultImage;
  @override
  String get image;
  @override
  String get coverPhoto;
  @override
  String get coverPhotoUri;
  @override
  String get imageUri;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityMetadataCopyWith<_$_CommunityMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
