import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/router/routes.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kheemwel\'s Flutter Apps')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            CounterRoute().go(context);
          },
          child: Text('Go to counter'),
        ),
      ),
    );
  }
}
