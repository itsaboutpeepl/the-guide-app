// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Events _$EventsFromJson(Map<String, dynamic> json) {
  return _Events.fromJson(json);
}

/// @nodoc
class _$EventsTearOff {
  const _$EventsTearOff();

  _Events call(
      {required DateTime startDate,
      required DateTime endDate,
      required String eventTitle,
      required String location,
      required String coordinates,
      required String time}) {
    return _Events(
      startDate: startDate,
      endDate: endDate,
      eventTitle: eventTitle,
      location: location,
      coordinates: coordinates,
      time: time,
    );
  }

  Events fromJson(Map<String, Object> json) {
    return Events.fromJson(json);
  }
}

/// @nodoc
const $Events = _$EventsTearOff();

/// @nodoc
mixin _$Events {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get coordinates => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventsCopyWith<Events> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsCopyWith<$Res> {
  factory $EventsCopyWith(Events value, $Res Function(Events) then) =
      _$EventsCopyWithImpl<$Res>;
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      String eventTitle,
      String location,
      String coordinates,
      String time});
}

/// @nodoc
class _$EventsCopyWithImpl<$Res> implements $EventsCopyWith<$Res> {
  _$EventsCopyWithImpl(this._value, this._then);

  final Events _value;
  // ignore: unused_field
  final $Res Function(Events) _then;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? eventTitle = freezed,
    Object? location = freezed,
    Object? coordinates = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventTitle: eventTitle == freezed
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EventsCopyWith<$Res> implements $EventsCopyWith<$Res> {
  factory _$EventsCopyWith(_Events value, $Res Function(_Events) then) =
      __$EventsCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      String eventTitle,
      String location,
      String coordinates,
      String time});
}

/// @nodoc
class __$EventsCopyWithImpl<$Res> extends _$EventsCopyWithImpl<$Res>
    implements _$EventsCopyWith<$Res> {
  __$EventsCopyWithImpl(_Events _value, $Res Function(_Events) _then)
      : super(_value, (v) => _then(v as _Events));

  @override
  _Events get _value => super._value as _Events;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? eventTitle = freezed,
    Object? location = freezed,
    Object? coordinates = freezed,
    Object? time = freezed,
  }) {
    return _then(_Events(
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventTitle: eventTitle == freezed
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Events extends _Events {
  _$_Events(
      {required this.startDate,
      required this.endDate,
      required this.eventTitle,
      required this.location,
      required this.coordinates,
      required this.time})
      : super._();

  factory _$_Events.fromJson(Map<String, dynamic> json) =>
      _$_$_EventsFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String eventTitle;
  @override
  final String location;
  @override
  final String coordinates;
  @override
  final String time;

  @override
  String toString() {
    return 'Events(startDate: $startDate, endDate: $endDate, eventTitle: $eventTitle, location: $location, coordinates: $coordinates, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Events &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.eventTitle, eventTitle) ||
                const DeepCollectionEquality()
                    .equals(other.eventTitle, eventTitle)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.coordinates, coordinates) ||
                const DeepCollectionEquality()
                    .equals(other.coordinates, coordinates)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(eventTitle) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(coordinates) ^
      const DeepCollectionEquality().hash(time);

  @JsonKey(ignore: true)
  @override
  _$EventsCopyWith<_Events> get copyWith =>
      __$EventsCopyWithImpl<_Events>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventsToJson(this);
  }
}

abstract class _Events extends Events {
  factory _Events(
      {required DateTime startDate,
      required DateTime endDate,
      required String eventTitle,
      required String location,
      required String coordinates,
      required String time}) = _$_Events;
  _Events._() : super._();

  factory _Events.fromJson(Map<String, dynamic> json) = _$_Events.fromJson;

  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  String get eventTitle => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  String get coordinates => throw _privateConstructorUsedError;
  @override
  String get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventsCopyWith<_Events> get copyWith => throw _privateConstructorUsedError;
}
