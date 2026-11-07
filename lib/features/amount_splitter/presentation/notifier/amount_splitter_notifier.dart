import 'package:my_flutter_apps/features/amount_splitter/presentation/state/amount_splitter_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/split_part.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/splitter_mode.dart';
import 'package:my_flutter_apps/features/amount_splitter/services/splitter.dart';

part 'amount_splitter_notifier.g.dart';

@riverpod
class AmountSplitterNotifier extends _$AmountSplitterNotifier {
  int _nextPartId = 0;

  @override
  AmountSplitterState build() => const AmountSplitterState();

  void modeChanged(SplitterMode mode) {
    state = state.copyWith(mode: mode);
  }

  void amountChanged(double? amount) {
    state = state.copyWith(amount: amount, manualParts: const <SplitPart>[]);
  }

  void partCountChanged(int? partCount) {
    state = state.copyWith(partCount: partCount);
  }

  void allowDecimalToggled(bool value) {
    state = state.copyWith(allowDecimal: value);
  }

  void equalOnlyToggled(bool value) {
    state = state.copyWith(equalOnly: value);
  }

  void splitRemainingRequested() {
    final int splittableUnits = state.splittableUnits;
    if (splittableUnits <= 0) return;

    final List<int> halfAmounts = halveAmount(splittableUnits, state.unit);
    final List<SplitPart> createdParts = halfAmounts
        .map((int amount) => SplitPart(id: _nextPartId++, amount: amount))
        .toList(growable: false);

    state = state.copyWith(
      manualParts: <SplitPart>[...state.manualParts, ...createdParts],
    );
  }

  void partRemoveRequested(int partId) {
    state = state.copyWith(
      manualParts: state.manualParts
          .where((SplitPart part) => part.id != partId)
          .toList(growable: false),
    );
  }

  void partDivideRequested(int partId) {
    final SplitPart? targetPart = state.normalizedManualParts
        .where((SplitPart part) => part.id == partId)
        .firstOrNull;
    if (targetPart == null) return;

    final List<int> halfAmounts = halveAmount(targetPart.amount, state.unit);
    if (halfAmounts.length < 2) return;

    final List<SplitPart> nextParts = <SplitPart>[];
    for (final SplitPart part in state.manualParts) {
      if (part.id == partId) {
        for (final int halfAmount in halfAmounts) {
          nextParts.add(SplitPart(id: _nextPartId++, amount: halfAmount));
        }
      } else {
        nextParts.add(part);
      }
    }

    state = state.copyWith(manualParts: nextParts);
  }

  void partsClearRequested() {
    state = state.copyWith(manualParts: const <SplitPart>[]);
  }
}
