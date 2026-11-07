import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/core/router/routes.dart';
import 'package:my_flutter_apps/features/counter/bloc/counter_bloc.dart';
import 'package:my_flutter_apps/features/counter/bloc/counter_event.dart';
import 'package:my_flutter_apps/features/counter/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(), child: _CounterView());
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsetsGeometry.fromLTRB(16, 16, 16, 24),
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
                          BlocBuilder<CounterBloc, CounterState>(
                            builder: (context, state) {
                              return Expanded(
                                child: _CountTile(
                                  label: 'Count',
                                  value: state.value,
                                  color: context.colorScheme.primary,
                                ),
                              );
                            },
                          ),
                          BlocBuilder<CounterBloc, CounterState>(
                            builder: (context, state) {
                              return Expanded(
                                child: _CountTile(
                                  label: 'Doubled',
                                  value: state.doubled,
                                  color: context.colorScheme.tertiary,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    _CounterButtons(),
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

class _CounterButtons extends StatelessWidget {
  const _CounterButtons();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 380) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              _decrementButton(context),
              _resetButton(context),
              _incrementButton(context),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            _decrementButton(context),
            _resetButton(context),
            _incrementButton(context),
          ],
        );
      },
    );
  }

  Widget _decrementButton(BuildContext context) => FilledButton.icon(
    label: const Text('Decrement'),
    onPressed: () =>
        context.read<CounterBloc>().add(CounterEvent.decrementPressed()),
    icon: const Icon(Icons.remove),
  );

  Widget _resetButton(BuildContext context) => FilledButton.tonalIcon(
    label: const Text('Reset'),
    onPressed: () =>
        context.read<CounterBloc>().add(CounterEvent.resetPressed()),
    icon: const Icon(Icons.refresh),
  );

  Widget _incrementButton(BuildContext context) => FilledButton.icon(
    label: const Text('Increment'),
    onPressed: () =>
        context.read<CounterBloc>().add(CounterEvent.incrementPressed()),
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
