import 'package:freezed_annotation/freezed_annotation.dart';

part 'odds_calculator_event.freezed.dart';

@freezed
abstract class OddsCalculatorEvent with _$OddsCalculatorEvent {
  const factory OddsCalculatorEvent.chanceChanged(double chance) =
      ChanceChanged;
}
