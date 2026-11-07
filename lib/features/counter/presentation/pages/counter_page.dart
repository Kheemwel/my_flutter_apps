import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_apps/features/counter/presentation/notifier/counter_notifier.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) => const _CounterView();
}

class _CounterView extends ConsumerWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 24,
                  children: [
                    Text(
                      'Counter Demo',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          Expanded(
                            child: _CountTile(
                              label: 'Count',
                              value: ref.watch(
                                counterProvider.select((s) => s.value),
                              ),
                              color: context.colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: _CountTile(
                              label: 'Doubled',
                              value: ref.watch(
                                counterProvider.select((s) => s.doubled),
                              ),
                              color: context.colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const _CounterButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CounterButtons extends ConsumerWidget {
  const _CounterButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(counterProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final buttons = <Widget>[
          _decrementButton(notifier),
          _resetButton(notifier),
          _incrementButton(notifier),
        ];
        if (constraints.maxWidth < 380) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: buttons,
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: buttons,
        );
      },
    );
  }

  Widget _decrementButton(CounterNotifier notifier) => FilledButton.icon(
    label: const Text('Decrement'),
    onPressed: notifier.decrement,
    icon: const Icon(Icons.remove),
  );

  Widget _resetButton(CounterNotifier notifier) => FilledButton.tonalIcon(
    label: const Text('Reset'),
    onPressed: notifier.reset,
    icon: const Icon(Icons.refresh),
  );

  Widget _incrementButton(CounterNotifier notifier) => FilledButton.icon(
    label: const Text('Increment'),
    onPressed: notifier.increment,
    icon: const Icon(Icons.add),
  );
}

class _CountTile extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _CountTile({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '$value',
              style: TextStyle(
                color: color,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
