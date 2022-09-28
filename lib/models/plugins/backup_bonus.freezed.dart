// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'backup_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BackupBonusPlugin _$BackupBonusPluginFromJson(Map<String, dynamic> json) {
  return _BackupBonusPlugin.fromJson(json);
}

/// @nodoc
mixin _$BackupBonusPlugin {
  String get type => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackupBonusPluginCopyWith<BackupBonusPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupBonusPluginCopyWith<$Res> {
  factory $BackupBonusPluginCopyWith(
          BackupBonusPlugin value, $Res Function(BackupBonusPlugin) then) =
      _$BackupBonusPluginCopyWithImpl<$Res>;
  $Res call({String type, String? amount, String? name, bool isActive});
}

/// @nodoc
class _$BackupBonusPluginCopyWithImpl<$Res>
    implements $BackupBonusPluginCopyWith<$Res> {
  _$BackupBonusPluginCopyWithImpl(this._value, this._then);

  final BackupBonusPlugin _value;
  // ignore: unused_field
  final $Res Function(BackupBonusPlugin) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_BackupBonusPluginCopyWith<$Res>
    implements $BackupBonusPluginCopyWith<$Res> {
  factory _$$_BackupBonusPluginCopyWith(_$_BackupBonusPlugin value,
          $Res Function(_$_BackupBonusPlugin) then) =
      __$$_BackupBonusPluginCopyWithImpl<$Res>;
  @override
  $Res call({String type, String? amount, String? name, bool isActive});
}

/// @nodoc
class __$$_BackupBonusPluginCopyWithImpl<$Res>
    extends _$BackupBonusPluginCopyWithImpl<$Res>
    implements _$$_BackupBonusPluginCopyWith<$Res> {
  __$$_BackupBonusPluginCopyWithImpl(
      _$_BackupBonusPlugin _value, $Res Function(_$_BackupBonusPlugin) _then)
      : super(_value, (v) => _then(v as _$_BackupBonusPlugin));

  @override
  _$_BackupBonusPlugin get _value => super._value as _$_BackupBonusPlugin;

  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_BackupBonusPlugin(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_BackupBonusPlugin
    with DiagnosticableTreeMixin, Plugin
    implements _BackupBonusPlugin {
  _$_BackupBonusPlugin(
      {this.type = 'backupBonus',
      this.amount = null,
      this.name = null,
      this.isActive = false});

  factory _$_BackupBonusPlugin.fromJson(Map<String, dynamic> json) =>
      _$$_BackupBonusPluginFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String? amount;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BackupBonusPlugin(type: $type, amount: $amount, name: $name, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BackupBonusPlugin'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackupBonusPlugin &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$$_BackupBonusPluginCopyWith<_$_BackupBonusPlugin> get copyWith =>
      __$$_BackupBonusPluginCopyWithImpl<_$_BackupBonusPlugin>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BackupBonusPluginToJson(
      this,
    );
  }
}

abstract class _BackupBonusPlugin implements BackupBonusPlugin, Plugin {
  factory _BackupBonusPlugin(
      {final String type,
      final String? amount,
      final String? name,
      final bool isActive}) = _$_BackupBonusPlugin;

  factory _BackupBonusPlugin.fromJson(Map<String, dynamic> json) =
      _$_BackupBonusPlugin.fromJson;

  @override
  String get type;
  @override
  String? get amount;
  @override
  String? get name;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_BackupBonusPluginCopyWith<_$_BackupBonusPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}
