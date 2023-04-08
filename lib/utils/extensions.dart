import 'package:intl/intl.dart';
import 'package:html/parser.dart' as html;

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}

extension CapitalizeString on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }

  String maxChars(int count) {
    if (length > count) {
      return substring(0, count);
    }
    return this;
  }

  String capitalizeWords() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.capitalize())
        .join(' ');
  }

  String parseHtmlString() {
    final document = html.parse(this);
    final String parsedString =
        html.parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}

extension NumHelpers on num {
  String get formattedPrice => '£${(this / 100).toStringAsFixed(2)}';
  String get formattedPriceNoDec => '£${(this / 100).toStringAsFixed(0)}';
}

List<Map<String, String>> getSelectableDatesForDeliverySlots() {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  final List<Map<String, String>> listOfSelectableDates = [];

  DateTime currentDate = DateTime.parse(formatter.format(DateTime.now()));
  final DateTime currentDate2 =
      DateTime.parse(formatter.format(DateTime.now()));

  for (var i = 0; i < 8; i++) {
    listOfSelectableDates.add(
      {currentDate.ordinalDate(): currentDate2.relativeDay(currentDate)},
    );
    currentDate = currentDate.add(const Duration(days: 1));
  }

  return listOfSelectableDates;
}

extension DateTimeHelpers on DateTime {
  /// Returns a [String] containing the relative day from [other].
  /// Counts in terms of absolute values.
  ///
  /// Example:
  ///
  /// Current Date is 12-02-2022
  ///
  /// Other Date is 13-02-2022: Will return 'Today'
  ///
  /// Other date is 14-02-2022: Will return 'Tomorrow'
  ///
  /// Any other day is returned as [DateFormat.WEEKDAY]
  String relativeDay(DateTime other) {
    switch (difference(other).inDays.abs()) {
      case 0:
        return 'Today';
      case 1:
        return 'Tomorrow';
      default:
        return DateFormat(DateFormat.WEEKDAY).format(other);
    }
  }

  /// Returns a [String] containing the Ordinal Date
  ///
  /// Example:
  ///
  /// 01-12-2022 will return 1st
  ///
  /// 29-08-2021 will return 29th
  String ordinalDate() {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }

    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  String get shortMonth {
    return DateFormat.MMM().format(this);
  }

  String get hoursAndMinutes {
    return DateFormat.Hm().format(this);
  }
}
