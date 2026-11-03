import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/router/routes.dart';

class CounterPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => HomeRoute().go(context),
        ),
        title: Text('Counter'),
      ),
      body: Center(child: Text('Counter Page')),
    );
  }
}
