import 'package:flutter/material.dart';

class CounterState {
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  void incrementCounter() {
    counter.value++;
    //print(_counter.value);
  }

  void resetCounter() {
    counter.value = 0;
  }

  void decrementCounter() {
    counter.value--;
    //print(_counter.value);
  }
}
