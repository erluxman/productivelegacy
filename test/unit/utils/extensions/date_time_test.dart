import 'package:flutter_test/flutter_test.dart';
import 'package:productive_app/utils/extensions/datetime.dart';

void main() {
  group("Date time Extension tests", () {
    test("test toStringYYYYMMDD with separator", () {
      expect(DateTime(2010,11,15).toStringYYYYMMDD(separator:"-"), "2010-11-15");
      expect(DateTime(2019,1,2).toStringYYYYMMDD(separator:"-"), "2019-01-02");
      expect(DateTime(2020,1,2).toStringYYYYMMDD(separator:" "), "2020 01 02");
      expect(DateTime(2020,10,2).toStringYYYYMMDD(separator:"-"), "2020-10-02");
      expect(DateTime(2022,10,2).toStringYYYYMMDD(separator:"-"), "2020-10-02");
    });
  });
}
