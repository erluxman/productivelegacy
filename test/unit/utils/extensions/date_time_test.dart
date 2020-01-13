import 'package:flutter_test/flutter_test.dart';
import 'package:productive_app/utils/extensions/datetime.dart';

void main() {
  group("Date time Extension tests", () {
    test("test toStringYYYYMMDD with separator", () {
      expect(DateTime(2010,11,15).toStringYYYYMMDD(sep:"-"), "2010-11-15");
      expect(DateTime(2019,1,2).toStringYYYYMMDD(sep:"-"), "2019-01-02");
      expect(DateTime(2020,1,2).toStringYYYYMMDD(sep:" "), "2020 01 02");
      expect(DateTime(2020,10,2).toStringYYYYMMDD(sep:"-"), "2020-10-02");
    });
  });
}
