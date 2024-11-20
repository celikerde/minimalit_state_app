import 'package:flutter/material.dart';
import 'package:minimalist_state/counter_state.dart';
import 'package:minimalist_state/service_locator.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return ValueListenableBuilder<int>(
      valueListenable: state.counter,
      builder: (context, value, _) {
        return Icon(
          value >= 0 ? Icons.mood : Icons.mood_bad,
          color: value >= 0 ? Colors.green : Colors.red,
        );
      },
    );
  }
}
