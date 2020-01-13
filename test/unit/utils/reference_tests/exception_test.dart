import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Exception/Error testing", () {
    test("Asset Failure test", () {
      expect(_testAssertion(true), true);
      expect(() => _testAssertion(false), throwsA(isA<AssertionError>()));
    });
    test("test method throwing errors", () {
      expect(_testError(fails: false), false);
      expect(() => _testError(fails: true), throwsA(isA<FooError>()));
    });
  });
}

bool _testError({bool fails}) {
  if(fails)throw FooError();
  return fails;
}

class FooError extends Error {}

bool _testAssertion(bool assertValue) {
  assert(assertValue);
  return assertValue;
}
