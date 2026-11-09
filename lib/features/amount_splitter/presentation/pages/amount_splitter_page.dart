import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/split_part.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/splitter_mode.dart';
import 'package:my_flutter_apps/features/amount_splitter/presentation/notifier/amount_splitter_notifier.dart';
import 'package:my_flutter_apps/features/amount_splitter/presentation/state/amount_splitter_state.dart';
import 'package:my_flutter_apps/features/amount_splitter/services/splitter.dart';

class AmountSplitterPage extends StatelessWidget {
  const AmountSplitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AmountSplitterView();
  }
}

class _AmountSplitterView extends StatelessWidget {
  const _AmountSplitterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amount Splitter')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _ModeToggleSection(),
                  SizedBox(height: 16),
                  _InputSection(),
                  SizedBox(height: 16),
                  _StatsSection(),
                  SizedBox(height: 16),
                  _PartsHeaderSection(),
                  SizedBox(height: 8),
                  Expanded(child: _PartsListSection()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ModeToggleSection extends ConsumerWidget {
  const _ModeToggleSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SplitterMode selectedMode = ref.watch(
      amountSplitterProvider.select((AmountSplitterState state) => state.mode),
    );

    return SegmentedButton<SplitterMode>(
      segments: const <ButtonSegment<SplitterMode>>[
        ButtonSegment<SplitterMode>(
          value: SplitterMode.manual,
          label: Text('Manual'),
        ),
        ButtonSegment<SplitterMode>(
          value: SplitterMode.auto,
          label: Text('Auto'),
        ),
      ],
      selected: <SplitterMode>{selectedMode},
      onSelectionChanged: (Set<SplitterMode> selection) {
        ref.read(amountSplitterProvider.notifier).modeChanged(selection.first);
      },
    );
  }
}

class _InputSection extends ConsumerStatefulWidget {
  const _InputSection();

  @override
  ConsumerState<_InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends ConsumerState<_InputSection> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _partCountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _partCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We watch three booleans/derived flags. Each is a cheap comparison;
    // using a single watch with a record keeps the rebuild scope tight.
    final (
      SplitterMode currentMode,
      bool allowDecimal,
      bool equalOnly,
      bool canSplitRemaining,
    ) = ref.watch(
      amountSplitterProvider.select(
        (AmountSplitterState state) => (
          state.mode,
          state.allowDecimal,
          state.equalOnly,
          state.canSplitRemaining,
        ),
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Total amount',
                hintText: 'e.g. 100',
              ),
              onChanged: (String rawValue) {
                final double? parsedAmount = double.tryParse(rawValue);
                ref
                    .read(amountSplitterProvider.notifier)
                    .amountChanged(
                      (parsedAmount != null && parsedAmount.isFinite)
                          ? parsedAmount
                          : null,
                    );
              },
            ),
            if (currentMode == SplitterMode.auto) ...<Widget>[
              const SizedBox(height: 12),
              TextField(
                controller: _partCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of parts',
                  hintText: 'e.g. 3',
                ),
                onChanged: (String rawValue) {
                  final int? parsedCount = int.tryParse(rawValue);
                  ref
                      .read(amountSplitterProvider.notifier)
                      .partCountChanged(parsedCount);
                },
              ),
            ],
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Allow decimals'),
              value: allowDecimal,
              onChanged: (bool value) {
                ref
                    .read(amountSplitterProvider.notifier)
                    .allowDecimalToggled(value);
              },
            ),
            if (currentMode == SplitterMode.auto)
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Equal parts only'),
                value: equalOnly,
                onChanged: (bool value) {
                  ref
                      .read(amountSplitterProvider.notifier)
                      .equalOnlyToggled(value);
                },
              ),
            if (currentMode == SplitterMode.manual) ...<Widget>[
              const SizedBox(height: 8),
              FilledButton(
                onPressed: canSplitRemaining
                    ? () {
                        ref
                            .read(amountSplitterProvider.notifier)
                            .splitRemainingRequested();
                      }
                    : null,
                child: const Text('Split remaining in 2'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatsSection extends ConsumerWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      int totalUnits,
      int assignedUnits,
      int remainingUnits,
      bool allowDecimal,
    ) = ref.watch(
      amountSplitterProvider.select(
        (AmountSplitterState state) => (
          state.totalUnits,
          state.assignedUnits,
          state.remainingUnits,
          state.allowDecimal,
        ),
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _StatColumn(
                title: 'Total',
                value: formatAmount(totalUnits, allowDecimal: allowDecimal),
                color: context.colorScheme.onSurface,
              ),
            ),
            Expanded(
              child: _StatColumn(
                title: 'Assigned',
                value: formatAmount(assignedUnits, allowDecimal: allowDecimal),
                color: context.colorScheme.onSurface,
              ),
            ),
            Expanded(
              child: _StatColumn(
                title: 'Extra',
                value: formatAmount(remainingUnits, allowDecimal: allowDecimal),
                color: remainingUnits == 0
                    ? context.colorScheme.primary
                    : context.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: context.textTheme.labelMedium),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textTheme.titleLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}

class _PartsHeaderSection extends ConsumerWidget {
  const _PartsHeaderSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (SplitterMode currentMode, int visiblePartsCount) = ref.watch(
      amountSplitterProvider.select(
        (AmountSplitterState state) => (state.mode, state.visibleParts.length),
      ),
    );

    final bool isManualMode = currentMode == SplitterMode.manual;
    final bool isEmpty = visiblePartsCount == 0;

    return Row(
      children: <Widget>[
        Text(
          'Parts',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Chip(label: Text('$visiblePartsCount')),
        const Spacer(),
        if (isManualMode)
          TextButton(
            onPressed: isEmpty
                ? null
                : () {
                    ref
                        .read(amountSplitterProvider.notifier)
                        .partsClearRequested();
                  },
            child: const Text('Clear parts'),
          ),
      ],
    );
  }
}

class _PartsListSection extends ConsumerWidget {
  const _PartsListSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We need the whole list plus a couple of derived flags. Watching
    // via select with a record keeps the rebuild scope tight.
    final (
      SplitterMode currentMode,
      bool allowDecimal,
      int totalUnits,
      List<SplitPart> visibleParts,
      bool hasTooFewParts,
      int targetPartCount,
    ) = ref.watch(
      amountSplitterProvider.select(
        (AmountSplitterState state) => (
          state.mode,
          state.allowDecimal,
          state.totalUnits,
          state.visibleParts,
          state.hasTooFewParts,
          state.targetPartCount,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (hasTooFewParts) ...<Widget>[
          _TooFewPartsAlert(
            visiblePartsCount: visibleParts.length,
            targetPartCount: targetPartCount,
          ),
          const SizedBox(height: 8),
        ],
        if (visibleParts.isEmpty)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: context.colorScheme.outlineVariant),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                currentMode == SplitterMode.manual
                    ? 'Enter an amount, then press "Split remaining in 2".'
                    : 'Enter an amount and the number of parts.',
                textAlign: TextAlign.center,
              ),
            ),
          )
        else
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: visibleParts.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
              itemBuilder: (BuildContext context, int index) {
                return PartTile(
                  part: visibleParts[index],
                  index: index,
                  totalUnits: totalUnits,
                  allowDecimal: allowDecimal,
                  mode: currentMode,
                );
              },
            ),
          ),
      ],
    );
  }
}

class _TooFewPartsAlert extends StatelessWidget {
  const _TooFewPartsAlert({
    required this.visiblePartsCount,
    required this.targetPartCount,
  });

  final int visiblePartsCount;
  final int targetPartCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Only $visiblePartsCount of $targetPartCount parts '
        'could be made. Each part needs at least the smallest unit '
        '(1, or 0.01 with decimals).',
        style: TextStyle(color: context.colorScheme.onTertiaryContainer),
      ),
    );
  }
}

class PartTile extends ConsumerWidget {
  const PartTile({
    super.key,
    required this.part,
    required this.index,
    required this.totalUnits,
    required this.allowDecimal,
    required this.mode,
  });

  final SplitPart part;
  final int index;
  final int totalUnits;
  final bool allowDecimal;
  final SplitterMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double sharePercent = totalUnits > 0
        ? (part.amount / totalUnits) * 100
        : 0;
    final int unit = allowDecimal ? 1 : 100;
    final bool canDivide = canDivideAmount(part.amount, unit);
    final bool isManualMode = mode == SplitterMode.manual;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            if (isManualMode)
              IconButton(
                tooltip: 'Remove this part',
                icon: const Icon(Icons.close),
                onPressed: () => ref
                    .read(amountSplitterProvider.notifier)
                    .partRemoveRequested(part.id),
              ),
            CircleAvatar(
              radius: 14,
              backgroundColor: context.colorScheme.surfaceContainerHighest,
              child: Text('${index + 1}', style: const TextStyle(fontSize: 12)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        formatAmount(part.amount, allowDecimal: allowDecimal),
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${sharePercent.toStringAsFixed(2)}%',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: sharePercent / 100,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              ),
            ),
            if (isManualMode) ...<Widget>[
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: canDivide
                    ? () => ref
                          .read(amountSplitterProvider.notifier)
                          .partDivideRequested(part.id)
                    : null,
                child: const Text('÷ 2'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
