import 'package:productive_app/utils/extensions/numbers.dart';

extension DateTimeExtensions on DateTime {
  String toStringYYYYMMDD({String sep: "-"}) {
    String year = this.year.toString();
    String month = this.year.toStringTwoDigits();
    String day = this.year.toStringTwoDigits();
    return"$year$sep$month$sep$day";
  }
}
