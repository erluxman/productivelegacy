import 'package:flutter_test/flutter_test.dart';
import 'package:productive/features/counter/bloc/counter_bloc.dart';

main() {
  group("Test counter behviour", () {
    test("Counter is at zero at beginning", () async {
      CounterBloc counterBloc = CounterBloc();
      await expectLater(counterBloc.counter, emitsThrough(0));
    });

    test("Counter increases", () async {
      CounterBloc counterBloc = CounterBloc();
      counterBloc.increaseCounter();
      await expectLater(counterBloc.counter, emitsThrough(1));
    });

    test("Decrease increases", () async {
      CounterBloc counterBloc = CounterBloc();
      counterBloc.decreaseCounter();
      await expectLater(counterBloc.counter, emitsThrough(-1));
    });

    test("Cannot read after bloc is disposed", () async {
      CounterBloc counterBloc = CounterBloc();
      counterBloc.dispose();

      expect(() => counterBloc.decreaseCounter(), throwsA(isA<StateError>()));
      expect(
          () => counterBloc.decreaseCounter(),
          throwsA(predicate((e) =>
              e is StateError &&
              e.message == 'Cannot add new events after calling close')));
    });
  });
}
