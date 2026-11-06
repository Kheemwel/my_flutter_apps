import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/splitter_mode.dart';

part 'amount_splitter_event.freezed.dart';

@freezed
sealed class AmountSplitterEvent with _$AmountSplitterEvent {
  const factory AmountSplitterEvent.modeChanged(SplitterMode mode) =
      AmountSplitterModeChanged;

  const factory AmountSplitterEvent.amountChanged(double? amount) =
      AmountSplitterAmountChanged;

  const factory AmountSplitterEvent.partCountChanged(int? partCount) =
      AmountSplitterPartCountChanged;

  const factory AmountSplitterEvent.allowDecimalToggled(bool value) =
      AmountSplitterAllowDecimalToggled;

  const factory AmountSplitterEvent.equalOnlyToggled(bool value) =
      AmountSplitterEqualOnlyToggled;

  const factory AmountSplitterEvent.splitRequested() =
      AmountSplitterSplitRequested;

  const factory AmountSplitterEvent.removeRequested(int id) =
      AmountSplitterRemoveRequested;

  const factory AmountSplitterEvent.divideRequested(int id) =
      AmountSplitterDivideRequested;

  const factory AmountSplitterEvent.clearRequested() =
      AmountSplitterClearRequested;
}
