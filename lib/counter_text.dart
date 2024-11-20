import 'package:flutter/material.dart';
import 'package:minimalist_state/counter_state.dart';
import 'package:minimalist_state/service_locator.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return ValueListenableBuilder<int>(
      valueListenable: state.counter,
      builder: (context, value, _) {
        TextStyle style() {
          return TextStyle(color: value >= 0 ? Colors.green : Colors.red);
        }

        return Text("$value", style: style());
      },
    );
  }
}
