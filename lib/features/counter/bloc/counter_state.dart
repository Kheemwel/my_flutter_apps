import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.freezed.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({@Default(0) int value}) = _CounterState;

  const CounterState._();

  // Computed property for doubled count
  int get doubled => value * 2;
}
