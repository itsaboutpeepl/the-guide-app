// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rampInstant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RampInstantPlugin _$RampInstantPluginFromJson(Map<String, dynamic> json) {
  return _RampInstantPlugin.fromJson(json);
}

/// @nodoc
mixin _$RampInstantPlugin {
  String get name => throw _privateConstructorUsedError;
  String? get widgetUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RampInstantPluginCopyWith<RampInstantPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RampInstantPluginCopyWith<$Res> {
  factory $RampInstantPluginCopyWith(
          RampInstantPlugin value, $Res Function(RampInstantPlugin) then) =
      _$RampInstantPluginCopyWithImpl<$Res>;
  $Res call({String name, String? widgetUrl, String type, bool isActive});
}

/// @nodoc
class _$RampInstantPluginCopyWithImpl<$Res>
    implements $RampInstantPluginCopyWith<$Res> {
  _$RampInstantPluginCopyWithImpl(this._value, this._then);

  final RampInstantPlugin _value;
  // ignore: unused_field
  final $Res Function(RampInstantPlugin) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? widgetUrl = freezed,
    Object? type = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widgetUrl: widgetUrl == freezed
          ? _value.widgetUrl
          : widgetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RampInstantPluginCopyWith<$Res>
    implements $RampInstantPluginCopyWith<$Res> {
  factory _$$_RampInstantPluginCopyWith(_$_RampInstantPlugin value,
          $Res Function(_$_RampInstantPlugin) then) =
      __$$_RampInstantPluginCopyWithImpl<$Res>;
  @override
  $Res call({String name, String? widgetUrl, String type, bool isActive});
}

/// @nodoc
class __$$_RampInstantPluginCopyWithImpl<$Res>
    extends _$RampInstantPluginCopyWithImpl<$Res>
    implements _$$_RampInstantPluginCopyWith<$Res> {
  __$$_RampInstantPluginCopyWithImpl(
      _$_RampInstantPlugin _value, $Res Function(_$_RampInstantPlugin) _then)
      : super(_value, (v) => _then(v as _$_RampInstantPlugin));

  @override
  _$_RampInstantPlugin get _value => super._value as _$_RampInstantPlugin;

  @override
  $Res call({
    Object? name = freezed,
    Object? widgetUrl = freezed,
    Object? type = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_RampInstantPlugin(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      widgetUrl: widgetUrl == freezed
          ? _value.widgetUrl
          : widgetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_RampInstantPlugin
    with DiagnosticableTreeMixin, Plugin
    implements _RampInstantPlugin {
  _$_RampInstantPlugin(
      {this.name = 'rampInstant',
      this.widgetUrl,
      this.type = 'deposit',
      this.isActive = false});

  factory _$_RampInstantPlugin.fromJson(Map<String, dynamic> json) =>
      _$$_RampInstantPluginFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final String? widgetUrl;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RampInstantPlugin(name: $name, widgetUrl: $widgetUrl, type: $type, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RampInstantPlugin'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('widgetUrl', widgetUrl))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RampInstantPlugin &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.widgetUrl, widgetUrl) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(widgetUrl),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$$_RampInstantPluginCopyWith<_$_RampInstantPlugin> get copyWith =>
      __$$_RampInstantPluginCopyWithImpl<_$_RampInstantPlugin>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RampInstantPluginToJson(this);
  }
}

abstract class _RampInstantPlugin implements RampInstantPlugin, Plugin {
  factory _RampInstantPlugin(
      {final String name,
      final String? widgetUrl,
      final String type,
      final bool isActive}) = _$_RampInstantPlugin;

  factory _RampInstantPlugin.fromJson(Map<String, dynamic> json) =
      _$_RampInstantPlugin.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get widgetUrl => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  bool get isActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RampInstantPluginCopyWith<_$_RampInstantPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}
