import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc with ChangeNotifier {

  CounterBloc(){
    _counterSubject.add(0);
  }
  BehaviorSubject<int> _counterSubject = BehaviorSubject();

  Stream<int> get counter => _counterSubject.stream;

  void increaseCounter() {
    _counterSubject.add(_counterSubject.value + 1);
  }

  void decreaseCounter() {
    _counterSubject.add(_counterSubject.value - 1);
  }

  @override
  void dispose() {
    super.dispose();
    _counterSubject.close();
  }
}
