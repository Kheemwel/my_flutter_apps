import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/split_part.dart';
import 'package:my_flutter_apps/features/amount_splitter/services/splitter.dart';

import 'amount_splitter_event.dart';
import 'amount_splitter_state.dart';

class AmountSplitterBloc
    extends Bloc<AmountSplitterEvent, AmountSplitterState> {
  AmountSplitterBloc() : super(const AmountSplitterState()) {
    on<AmountSplitterModeChanged>(_onModeChanged);
    on<AmountSplitterAmountChanged>(_onAmountChanged);
    on<AmountSplitterPartCountChanged>(_onPartCountChanged);
    on<AmountSplitterAllowDecimalToggled>(_onAllowDecimalToggled);
    on<AmountSplitterEqualOnlyToggled>(_onEqualOnlyToggled);
    on<AmountSplitterSplitRequested>(_onSplitRequested);
    on<AmountSplitterRemoveRequested>(_onRemoveRequested);
    on<AmountSplitterDivideRequested>(_onDivideRequested);
    on<AmountSplitterClearRequested>(_onClearRequested);
  }

  int _nextPartId = 0;

  void _onModeChanged(
    AmountSplitterModeChanged event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(state.copyWith(mode: event.mode));
  }

  void _onAmountChanged(
    AmountSplitterAmountChanged event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(
      state.copyWith(amount: event.amount, manualParts: const <SplitPart>[]),
    );
  }

  void _onPartCountChanged(
    AmountSplitterPartCountChanged event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(state.copyWith(partCount: event.partCount));
  }

  void _onAllowDecimalToggled(
    AmountSplitterAllowDecimalToggled event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(state.copyWith(allowDecimal: event.value));
  }

  void _onEqualOnlyToggled(
    AmountSplitterEqualOnlyToggled event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(state.copyWith(equalOnly: event.value));
  }

  void _onSplitRequested(
    AmountSplitterSplitRequested event,
    Emitter<AmountSplitterState> emit,
  ) {
    final int splittable = state.splittableUnits;
    if (splittable <= 0) return;

    final List<int> halves = halveAmount(splittable, state.unit);
    final List<SplitPart> created = halves
        .map((int amount) => SplitPart(id: _nextPartId++, amount: amount))
        .toList(growable: false);

    emit(
      state.copyWith(
        manualParts: <SplitPart>[...state.manualParts, ...created],
      ),
    );
  }

  void _onRemoveRequested(
    AmountSplitterRemoveRequested event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(
      state.copyWith(
        manualParts: state.manualParts
            .where((SplitPart part) => part.id != event.id)
            .toList(growable: false),
      ),
    );
  }

  void _onDivideRequested(
    AmountSplitterDivideRequested event,
    Emitter<AmountSplitterState> emit,
  ) {
    final SplitPart? target = state.normalizedManualParts
        .where((SplitPart part) => part.id == event.id)
        .firstOrNull;
    if (target == null) return;

    final List<int> halves = halveAmount(target.amount, state.unit);
    if (halves.length < 2) return;

    final List<SplitPart> nextParts = <SplitPart>[];
    for (final SplitPart part in state.manualParts) {
      if (part.id == event.id) {
        for (final int amount in halves) {
          nextParts.add(SplitPart(id: _nextPartId++, amount: amount));
        }
      } else {
        nextParts.add(part);
      }
    }

    emit(state.copyWith(manualParts: nextParts));
  }

  void _onClearRequested(
    AmountSplitterClearRequested event,
    Emitter<AmountSplitterState> emit,
  ) {
    emit(state.copyWith(manualParts: const <SplitPart>[]));
  }
}
