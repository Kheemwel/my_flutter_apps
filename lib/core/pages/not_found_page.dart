import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/router/routes.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '404',
              style: Theme.of(context).textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => const HomeRoute().go(context),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
