// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'join_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JoinBonusPlugin _$JoinBonusPluginFromJson(Map<String, dynamic> json) {
  return _JoinBonusPlugin.fromJson(json);
}

/// @nodoc
mixin _$JoinBonusPlugin {
  String get type => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinBonusPluginCopyWith<JoinBonusPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinBonusPluginCopyWith<$Res> {
  factory $JoinBonusPluginCopyWith(
          JoinBonusPlugin value, $Res Function(JoinBonusPlugin) then) =
      _$JoinBonusPluginCopyWithImpl<$Res>;
  $Res call({String type, String? amount, String? name, bool isActive});
}

/// @nodoc
class _$JoinBonusPluginCopyWithImpl<$Res>
    implements $JoinBonusPluginCopyWith<$Res> {
  _$JoinBonusPluginCopyWithImpl(this._value, this._then);

  final JoinBonusPlugin _value;
  // ignore: unused_field
  final $Res Function(JoinBonusPlugin) _then;

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
abstract class _$$_JoinBonusPluginCopyWith<$Res>
    implements $JoinBonusPluginCopyWith<$Res> {
  factory _$$_JoinBonusPluginCopyWith(
          _$_JoinBonusPlugin value, $Res Function(_$_JoinBonusPlugin) then) =
      __$$_JoinBonusPluginCopyWithImpl<$Res>;
  @override
  $Res call({String type, String? amount, String? name, bool isActive});
}

/// @nodoc
class __$$_JoinBonusPluginCopyWithImpl<$Res>
    extends _$JoinBonusPluginCopyWithImpl<$Res>
    implements _$$_JoinBonusPluginCopyWith<$Res> {
  __$$_JoinBonusPluginCopyWithImpl(
      _$_JoinBonusPlugin _value, $Res Function(_$_JoinBonusPlugin) _then)
      : super(_value, (v) => _then(v as _$_JoinBonusPlugin));

  @override
  _$_JoinBonusPlugin get _value => super._value as _$_JoinBonusPlugin;

  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_JoinBonusPlugin(
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
class _$_JoinBonusPlugin
    with DiagnosticableTreeMixin, Plugin
    implements _JoinBonusPlugin {
  _$_JoinBonusPlugin(
      {this.type = 'joinBonus',
      this.amount = null,
      this.name = null,
      this.isActive = false});

  factory _$_JoinBonusPlugin.fromJson(Map<String, dynamic> json) =>
      _$$_JoinBonusPluginFromJson(json);

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
    return 'JoinBonusPlugin(type: $type, amount: $amount, name: $name, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JoinBonusPlugin'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinBonusPlugin &&
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
  _$$_JoinBonusPluginCopyWith<_$_JoinBonusPlugin> get copyWith =>
      __$$_JoinBonusPluginCopyWithImpl<_$_JoinBonusPlugin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JoinBonusPluginToJson(this);
  }
}

abstract class _JoinBonusPlugin implements JoinBonusPlugin, Plugin {
  factory _JoinBonusPlugin(
      {final String type,
      final String? amount,
      final String? name,
      final bool isActive}) = _$_JoinBonusPlugin;

  factory _JoinBonusPlugin.fromJson(Map<String, dynamic> json) =
      _$_JoinBonusPlugin.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String? get amount => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  bool get isActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_JoinBonusPluginCopyWith<_$_JoinBonusPlugin> get copyWith =>
      throw _privateConstructorUsedError;
}
