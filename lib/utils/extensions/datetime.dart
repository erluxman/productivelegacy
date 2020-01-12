import 'package:productive_app/utils/extensions/numbers.dart';

extension DateTimeExtensions on DateTime {
  String toStringYYYYMMDD({String separator: "-"}) {
    return "${this.year.toString()}$separator${this.month.toStringTwoDigits()}$separator${this.day.toStringTwoDigits()}";
  }
}
