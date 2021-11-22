// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'directory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Directory _$DirectoryFromJson(Map<String, dynamic> json) {
  return _Directory.fromJson(json);
}

/// @nodoc
class _$DirectoryTearOff {
  const _$DirectoryTearOff();

  _Directory call(
      {required String directoryTitle,
      required String directoryLocation,
      required String directoryCoordinates,
      required String directoryWebsiteURL}) {
    return _Directory(
      directoryTitle: directoryTitle,
      directoryLocation: directoryLocation,
      directoryCoordinates: directoryCoordinates,
      directoryWebsiteURL: directoryWebsiteURL,
    );
  }

  Directory fromJson(Map<String, Object> json) {
    return Directory.fromJson(json);
  }
}

/// @nodoc
const $Directory = _$DirectoryTearOff();

/// @nodoc
mixin _$Directory {
  String get directoryTitle => throw _privateConstructorUsedError;
  String get directoryLocation => throw _privateConstructorUsedError;
  String get directoryCoordinates => throw _privateConstructorUsedError;
  String get directoryWebsiteURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectoryCopyWith<Directory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectoryCopyWith<$Res> {
  factory $DirectoryCopyWith(Directory value, $Res Function(Directory) then) =
      _$DirectoryCopyWithImpl<$Res>;
  $Res call(
      {String directoryTitle,
      String directoryLocation,
      String directoryCoordinates,
      String directoryWebsiteURL});
}

/// @nodoc
class _$DirectoryCopyWithImpl<$Res> implements $DirectoryCopyWith<$Res> {
  _$DirectoryCopyWithImpl(this._value, this._then);

  final Directory _value;
  // ignore: unused_field
  final $Res Function(Directory) _then;

  @override
  $Res call({
    Object? directoryTitle = freezed,
    Object? directoryLocation = freezed,
    Object? directoryCoordinates = freezed,
    Object? directoryWebsiteURL = freezed,
  }) {
    return _then(_value.copyWith(
      directoryTitle: directoryTitle == freezed
          ? _value.directoryTitle
          : directoryTitle // ignore: cast_nullable_to_non_nullable
              as String,
      directoryLocation: directoryLocation == freezed
          ? _value.directoryLocation
          : directoryLocation // ignore: cast_nullable_to_non_nullable
              as String,
      directoryCoordinates: directoryCoordinates == freezed
          ? _value.directoryCoordinates
          : directoryCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      directoryWebsiteURL: directoryWebsiteURL == freezed
          ? _value.directoryWebsiteURL
          : directoryWebsiteURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DirectoryCopyWith<$Res> implements $DirectoryCopyWith<$Res> {
  factory _$DirectoryCopyWith(
          _Directory value, $Res Function(_Directory) then) =
      __$DirectoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String directoryTitle,
      String directoryLocation,
      String directoryCoordinates,
      String directoryWebsiteURL});
}

/// @nodoc
class __$DirectoryCopyWithImpl<$Res> extends _$DirectoryCopyWithImpl<$Res>
    implements _$DirectoryCopyWith<$Res> {
  __$DirectoryCopyWithImpl(_Directory _value, $Res Function(_Directory) _then)
      : super(_value, (v) => _then(v as _Directory));

  @override
  _Directory get _value => super._value as _Directory;

  @override
  $Res call({
    Object? directoryTitle = freezed,
    Object? directoryLocation = freezed,
    Object? directoryCoordinates = freezed,
    Object? directoryWebsiteURL = freezed,
  }) {
    return _then(_Directory(
      directoryTitle: directoryTitle == freezed
          ? _value.directoryTitle
          : directoryTitle // ignore: cast_nullable_to_non_nullable
              as String,
      directoryLocation: directoryLocation == freezed
          ? _value.directoryLocation
          : directoryLocation // ignore: cast_nullable_to_non_nullable
              as String,
      directoryCoordinates: directoryCoordinates == freezed
          ? _value.directoryCoordinates
          : directoryCoordinates // ignore: cast_nullable_to_non_nullable
              as String,
      directoryWebsiteURL: directoryWebsiteURL == freezed
          ? _value.directoryWebsiteURL
          : directoryWebsiteURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Directory extends _Directory {
  _$_Directory(
      {required this.directoryTitle,
      required this.directoryLocation,
      required this.directoryCoordinates,
      required this.directoryWebsiteURL})
      : super._();

  factory _$_Directory.fromJson(Map<String, dynamic> json) =>
      _$_$_DirectoryFromJson(json);

  @override
  final String directoryTitle;
  @override
  final String directoryLocation;
  @override
  final String directoryCoordinates;
  @override
  final String directoryWebsiteURL;

  @override
  String toString() {
    return 'Directory(directoryTitle: $directoryTitle, directoryLocation: $directoryLocation, directoryCoordinates: $directoryCoordinates, directoryWebsiteURL: $directoryWebsiteURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Directory &&
            (identical(other.directoryTitle, directoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.directoryTitle, directoryTitle)) &&
            (identical(other.directoryLocation, directoryLocation) ||
                const DeepCollectionEquality()
                    .equals(other.directoryLocation, directoryLocation)) &&
            (identical(other.directoryCoordinates, directoryCoordinates) ||
                const DeepCollectionEquality().equals(
                    other.directoryCoordinates, directoryCoordinates)) &&
            (identical(other.directoryWebsiteURL, directoryWebsiteURL) ||
                const DeepCollectionEquality()
                    .equals(other.directoryWebsiteURL, directoryWebsiteURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(directoryTitle) ^
      const DeepCollectionEquality().hash(directoryLocation) ^
      const DeepCollectionEquality().hash(directoryCoordinates) ^
      const DeepCollectionEquality().hash(directoryWebsiteURL);

  @JsonKey(ignore: true)
  @override
  _$DirectoryCopyWith<_Directory> get copyWith =>
      __$DirectoryCopyWithImpl<_Directory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DirectoryToJson(this);
  }
}

abstract class _Directory extends Directory {
  factory _Directory(
      {required String directoryTitle,
      required String directoryLocation,
      required String directoryCoordinates,
      required String directoryWebsiteURL}) = _$_Directory;
  _Directory._() : super._();

  factory _Directory.fromJson(Map<String, dynamic> json) =
      _$_Directory.fromJson;

  @override
  String get directoryTitle => throw _privateConstructorUsedError;
  @override
  String get directoryLocation => throw _privateConstructorUsedError;
  @override
  String get directoryCoordinates => throw _privateConstructorUsedError;
  @override
  String get directoryWebsiteURL => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DirectoryCopyWith<_Directory> get copyWith =>
      throw _privateConstructorUsedError;
}
