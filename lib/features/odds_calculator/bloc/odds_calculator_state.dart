import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'odds_calculator_state.freezed.dart';

@freezed
abstract class OddsCalculatorState with _$OddsCalculatorState {
  const factory OddsCalculatorState({@Default(50) double chance}) =
      _OddsCalculatorState;

  const OddsCalculatorState._();

  int attempts(double confidence) {
    final double probability = chance / 100;
    final double threshold = confidence / 100;

    return (log(1 - threshold) / log(1 - probability)).ceil();
  }
}
