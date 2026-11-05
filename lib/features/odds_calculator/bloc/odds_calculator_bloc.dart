import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'odds_calculator_event.dart';
import 'odds_calculator_state.dart';

class OddsCalculatorBloc
    extends Bloc<OddsCalculatorEvent, OddsCalculatorState> {
  OddsCalculatorBloc() : super(const OddsCalculatorState()) {
    on<ChanceChanged>(_onChanceChanged);
  }

  FutureOr<void> _onChanceChanged(
    ChanceChanged event,
    Emitter<OddsCalculatorState> emit,
  ) {
    emit(state.copyWith(chance: event.chance));
  }
}
