import 'package:my_flutter_apps/features/counter/presentation/states/counter_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_notifier.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  CounterState build() => const CounterState();

  void increment() => state = state.copyWith(value: state.value + 1);
  void decrement() => state = state.copyWith(value: state.value - 1);
  void reset() => state = const CounterState(value: 0);
}
