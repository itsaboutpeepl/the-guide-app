// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Events _$EventsFromJson(Map<String, dynamic> json) {
  return _Events.fromJson(json);
}

/// @nodoc
mixin _$Events {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get bookingLink => throw _privateConstructorUsedError;

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
      String latitude,
      String longitude,
      String description,
      String bookingLink});
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? description = freezed,
    Object? bookingLink = freezed,
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
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookingLink: bookingLink == freezed
          ? _value.bookingLink
          : bookingLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EventsCopyWith<$Res> implements $EventsCopyWith<$Res> {
  factory _$$_EventsCopyWith(_$_Events value, $Res Function(_$_Events) then) =
      __$$_EventsCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      String eventTitle,
      String location,
      String latitude,
      String longitude,
      String description,
      String bookingLink});
}

/// @nodoc
class __$$_EventsCopyWithImpl<$Res> extends _$EventsCopyWithImpl<$Res>
    implements _$$_EventsCopyWith<$Res> {
  __$$_EventsCopyWithImpl(_$_Events _value, $Res Function(_$_Events) _then)
      : super(_value, (v) => _then(v as _$_Events));

  @override
  _$_Events get _value => super._value as _$_Events;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? eventTitle = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? description = freezed,
    Object? bookingLink = freezed,
  }) {
    return _then(_$_Events(
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
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bookingLink: bookingLink == freezed
          ? _value.bookingLink
          : bookingLink // ignore: cast_nullable_to_non_nullable
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
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.bookingLink})
      : super._();

  factory _$_Events.fromJson(Map<String, dynamic> json) =>
      _$$_EventsFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String eventTitle;
  @override
  final String location;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String description;
  @override
  final String bookingLink;

  @override
  String toString() {
    return 'Events(startDate: $startDate, endDate: $endDate, eventTitle: $eventTitle, location: $location, latitude: $latitude, longitude: $longitude, description: $description, bookingLink: $bookingLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Events &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality()
                .equals(other.eventTitle, eventTitle) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.bookingLink, bookingLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(eventTitle),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(bookingLink));

  @JsonKey(ignore: true)
  @override
  _$$_EventsCopyWith<_$_Events> get copyWith =>
      __$$_EventsCopyWithImpl<_$_Events>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventsToJson(
      this,
    );
  }
}

abstract class _Events extends Events {
  factory _Events(
      {required final DateTime startDate,
      required final DateTime endDate,
      required final String eventTitle,
      required final String location,
      required final String latitude,
      required final String longitude,
      required final String description,
      required final String bookingLink}) = _$_Events;
  _Events._() : super._();

  factory _Events.fromJson(Map<String, dynamic> json) = _$_Events.fromJson;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get eventTitle;
  @override
  String get location;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get description;
  @override
  String get bookingLink;
  @override
  @JsonKey(ignore: true)
  _$$_EventsCopyWith<_$_Events> get copyWith =>
      throw _privateConstructorUsedError;
}
