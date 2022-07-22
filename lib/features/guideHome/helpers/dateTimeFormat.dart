import 'package:intl/intl.dart';

String readTimestamp(int timestamp) {
  var time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  var dateTime24 = DateFormat('dd/MM/yyyy, HH:mm').format(time);

  return dateTime24;
}

String dateFormatter(DateTime timeToFormat) {
  return DateFormat('dd/MM/yyyy, HH:mm').format(timeToFormat);
}

DateTime readTimeStampToDate(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}

String daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);

  to = DateTime(to.year, to.month, to.day);

  return (to.difference(from).inDays).toString();
}

int daysBetweenInt(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);

  to = DateTime(to.year, to.month, to.day);

  return to.difference(from).inDays;
}
