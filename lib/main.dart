import 'package:flutter/material.dart';
import 'package:minimalist_state/counter_icon.dart';
import 'package:minimalist_state/counter_state.dart';
import 'package:minimalist_state/counter_text.dart';
import 'package:minimalist_state/list_view_container.dart';
import 'package:minimalist_state/service_locator.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final state = getIt.get<CounterState>();
    state.counter.addListener(() {
      if (state.counter.value > 0 && state.counter.value % 10 == 0) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                Navigator.of(context).pop();
                final state = getIt.get<CounterState>();
                state.resetCounter();
              },
            ),
          ],
        );
      },
    );
  }

  //CounterState counterState = CounterState();
  @override
  Widget build(BuildContext context) {
    final state = getIt.get<CounterState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          CounterIcon(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CounterText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.resetCounter();
                  },
                  tooltip: 'Reset',
                  child: const Icon(Icons.exposure_zero),
                ),
                FloatingActionButton(
                  onPressed: () {
                    final state = getIt.get<CounterState>();
                    state.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListViewContainer()),
          ],
        ),
      ),
    );
  }
}
