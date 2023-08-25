import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  bool isSameDate(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }
}

extension DateStringExtension on String {
  String dayMonthNameYearWithTime() {
    final formatter = DateFormat('dd MMM yyyy, hh:mm a');
    return formatter.format(DateTime.parse(this));
  }

  String dayMonthNameYear() {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(DateTime.parse(this));
  }
}
