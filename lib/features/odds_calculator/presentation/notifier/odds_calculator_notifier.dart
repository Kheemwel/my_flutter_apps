import 'package:my_flutter_apps/features/odds_calculator/presentation/states/odds_calculator_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'odds_calculator_notifier.g.dart';

@riverpod
class OddsCalculatorNotifier extends _$OddsCalculatorNotifier {
  @override
  OddsCalculatorState build() => const OddsCalculatorState();

  void chanceChanged(double chance) {
    state = state.copyWith(chance: chance);
  }
}
