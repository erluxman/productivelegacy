import 'package:productive_app/utils/extensions/numbers.dart';

extension DateTimeExtensions on DateTime {
  String toStringYYYYMMDD({String sep: "-"}) {
    return "${this.year.toString()}$sep${this.month.toStringTwoDigits()}$sep${this.day.toStringTwoDigits()}";
  }
}
