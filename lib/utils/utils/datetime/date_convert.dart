import 'package:intl/intl.dart';

String jsTimeToDateTimeString(String date) {
  var day = DateTime.fromMillisecondsSinceEpoch((int.parse(date)) * 1000).day;
  var month =
      DateTime.fromMillisecondsSinceEpoch((int.parse(date)) * 1000).month;
  var year = DateTime.fromMillisecondsSinceEpoch((int.parse(date)) * 1000).year;
  return '$month-$day-$year';
}

DateTime jsTimeToDateTime(String date) {
  var newDate = DateTime.fromMillisecondsSinceEpoch((int.parse(date)) * 1000);
  return newDate;
}

String jsTimeToTimehhmmaa(String date) {
  var newDate = DateTime.fromMillisecondsSinceEpoch((int.parse(date)) * 1000, isUtc: false);
  return DateFormat('hh:mm aa').format(newDate);
}

String jsTimeToTimehm(String date) {
  var newDate = DateTime.fromMillisecondsSinceEpoch((int.parse(date)) * 1000);
  return DateFormat('Hm').format(newDate);
}

String dateToTimeStringhhmmaa(DateTime date) {
  return DateFormat('hh:mm aa').format(date);
}

String dateToTimeStringhm(DateTime date) {
  return DateFormat('Hm').format(date);
}

String durationToTimeStringhm(Duration duration) {
  final nowDate = DateTime.now();
  return DateFormat('Hm')
      .format(DateTime(nowDate.year, nowDate.month, nowDate.day).add(duration));
}
