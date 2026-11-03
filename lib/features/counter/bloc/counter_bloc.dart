import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementPressed>(
      (event, emit) => emit(state.copyWith(value: state.value + 1)),
    );
    on<DecrementPressed>(
      (event, emit) => emit(state.copyWith(value: state.value - 1)),
    );
    on<ResetPressed>((event, emit) => emit(const CounterState(value: 0)));
  }
}
