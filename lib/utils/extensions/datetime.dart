import 'package:productive/utils/extensions/numbers.dart';

extension DateTimeExtensions on DateTime {
  String toStringYYYYMMDD({String sep: "-"}) {
    String year = this.year.toString();
    String month = this.month.toStringTwoDigits();
    String day = this.day.toStringTwoDigits();
    return"$year$sep$month$sep$day";
  }
}
