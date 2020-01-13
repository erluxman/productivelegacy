import 'package:flutter_test/flutter_test.dart';
import 'package:productive/utils/extensions/numbers.dart';

void main() {
  group("NumberTest", () {
    test("test two digit number's string for |number| <100 ", () {
      expect(4.toStringTwoDigits(), "04");
      expect((-4).toStringTwoDigits(), "-04");
      expect(10.toStringTwoDigits(), "10");
      expect((-10).toStringTwoDigits(), "-10");
      expect(99.toStringTwoDigits(), "99");
      expect((-99).toStringTwoDigits(), "-99");
    });

    test("test error for two digit number's string for |number| >=100 ", () {
      expect(()=>100.toStringTwoDigits(), throwsA(isA<AssertionError  >()));
      expect(()=>(-100).toStringTwoDigits(), throwsA(isA<AssertionError  >()));
    });
  });
}
