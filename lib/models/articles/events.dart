import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';
part 'events.g.dart';

@freezed
class Events with _$Events {
  const Events._();

  @JsonSerializable()
  factory Events({
    required DateTime startDate,
    required DateTime endDate,
    required String eventTitle,
    required String location,
    required String latitude,
    required String longitude,
    required String description,
    required String bookingLink,
  }) = _Events;

  factory Events.fromJson(dynamic json) => _$EventsFromJson(json);

  bool get isSameDay {
    if (startDate.difference(endDate).inHours <= 24) return true;

    return false;
  }

  bool get isCompletedEvent {
    if (startDate.difference(DateTime.now()).isNegative) return true;
    return false;
  }
}
