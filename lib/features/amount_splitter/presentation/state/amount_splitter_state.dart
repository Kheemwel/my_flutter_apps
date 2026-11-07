import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/split_part.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/splitter_mode.dart';
import 'package:my_flutter_apps/features/amount_splitter/services/splitter.dart';

part 'amount_splitter_state.freezed.dart';

@freezed
abstract class AmountSplitterState with _$AmountSplitterState {
  const factory AmountSplitterState({
    @Default(SplitterMode.manual) SplitterMode mode,
    double? amount,
    int? partCount,
    @Default(false) bool allowDecimal,
    @Default(false) bool equalOnly,
    @Default(<SplitPart>[]) List<SplitPart> manualParts,
  }) = _AmountSplitterState;

  const AmountSplitterState._();

  /// The smallest assignable unit, in hundredths of a currency unit.
  /// 100 when decimals are disallowed, 1 when they are allowed.
  int get unit => allowDecimal ? 1 : 100;

  /// Total amount expressed in smallest units.
  int get totalUnits {
    final double? raw = amount;
    if (raw == null || !raw.isFinite || raw <= 0) return 0;
    return (raw * 100).round();
  }

  /// Manual parts, snapped to the current unit and filtered to positive values.
  List<SplitPart> get normalizedManualParts {
    final int currentUnit = unit;
    return manualParts
        .map(
          (SplitPart part) => SplitPart(
            id: part.id,
            amount: (part.amount ~/ currentUnit) * currentUnit,
          ),
        )
        .where((SplitPart part) => part.amount > 0)
        .toList(growable: false);
  }

  /// Auto parts, computed from the total amount and part count.
  List<SplitPart> get autoParts {
    return distributeAuto(
      totalAmount: totalUnits,
      partCount: targetPartCount,
      unit: unit,
      equalOnly: equalOnly,
    );
  }

  /// The parts that are currently displayed, depending on the mode.
  List<SplitPart> get visibleParts {
    return mode == SplitterMode.auto ? autoParts : normalizedManualParts;
  }

  /// Sum of all visible parts, in smallest units.
  int get assignedUnits {
    return visibleParts.fold<int>(
      0,
      (int sum, SplitPart part) => sum + part.amount,
    );
  }

  /// Amount that has not yet been assigned, in smallest units.
  int get remainingUnits => totalUnits - assignedUnits;

  /// The portion of [remainingUnits] that can actually be split, rounded down
  /// to the current unit.
  int get splittableUnits {
    final int safeRemaining = remainingUnits < 0 ? 0 : remainingUnits;
    return (safeRemaining ~/ unit) * unit;
  }

  /// Requested part count, clamped to [maxSplitParts].
  int get targetPartCount {
    final int? requested = partCount;
    if (requested == null || requested < 1) return 0;
    return requested > maxSplitParts ? maxSplitParts : requested;
  }

  /// True when auto mode could not create as many parts as requested.
  bool get hasTooFewParts {
    return mode == SplitterMode.auto &&
        totalUnits > 0 &&
        visibleParts.length < targetPartCount;
  }

  /// Whether the "split remaining in 2" action is currently possible.
  bool get canSplitRemaining => splittableUnits > 0;
}
