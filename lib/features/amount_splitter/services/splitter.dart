import 'package:my_flutter_apps/features/amount_splitter/domain/entities/split_part.dart';

/// Safety cap so a typo (e.g. 1,000,000 parts) cannot freeze the UI.
const int maxSplitParts = 200;

/// Distributes [totalAmount] (in smallest units) into [partCount] parts.
///
/// When [equalOnly] is true, every part receives the floor share and any
/// remainder is left unassigned. Otherwise, the remainder is spread one unit
/// at a time across the first parts.
List<SplitPart> distributeAuto({
  required int totalAmount,
  required int partCount,
  required int unit,
  required bool equalOnly,
}) {
  final int safeCount = partCount.clamp(0, maxSplitParts);
  final int totalUnits = totalAmount ~/ unit;
  if (safeCount < 1 || totalUnits < 1) {
    return const <SplitPart>[];
  }

  final int baseShare = totalUnits ~/ safeCount;
  final int remainder = totalUnits % safeCount;

  final List<SplitPart> parts = <SplitPart>[];
  for (int index = 0; index < safeCount; index++) {
    final int share = equalOnly
        ? baseShare
        : baseShare + (index < remainder ? 1 : 0);
    if (share > 0) {
      parts.add(SplitPart(id: index, amount: share * unit));
    }
  }
  return parts;
}

/// Halves [amount] (in smallest units) without going below [unit].
/// The larger half comes first: 5 units -> [3, 2].
List<int> halveAmount(int amount, int unit) {
  final int wholeUnits = amount ~/ unit;
  final int firstHalf = (wholeUnits / 2).ceil();
  final int secondHalf = wholeUnits - firstHalf;
  return <int>[firstHalf, secondHalf]
      .where((int value) => value > 0)
      .map((int value) => value * unit)
      .toList(growable: false);
}

bool canDivideAmount(int amount, int unit) {
  return halveAmount(amount, unit).length == 2;
}

/// Formats [amount] (in smallest units) for display.
///
/// When [allowDecimal] is true, or [amount] is not a whole currency unit,
/// the value is shown with two decimal places. Thousands are grouped with
/// commas. The caller decides what the unit represents (e.g. dollars, coins).
String formatAmount(int amount, {required bool allowDecimal}) {
  final int digitCount = allowDecimal || amount % 100 != 0 ? 2 : 0;
  final double value = amount / 100;
  final String fixed = value.toStringAsFixed(digitCount);
  final List<String> segments = fixed.split('.');
  final String groupedInteger = segments[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (Match _) => ',',
  );
  return segments.length > 1
      ? '$groupedInteger.${segments[1]}'
      : groupedInteger;
}
