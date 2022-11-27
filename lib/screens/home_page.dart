import 'package:flutter/material.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('widget updated');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Counter:'),
            CounterWidget(), //! to update only this widget
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().substract(); //!
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(width: 16.0),
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().reset(); //!
            },
            child: const Icon(
              Icons.exposure_zero,
            ),
          ),
          const SizedBox(width: 16.0),
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().increment(); //!
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}');
  }
}
