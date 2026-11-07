import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/split_part.dart';
import 'package:my_flutter_apps/features/amount_splitter/domain/entities/splitter_mode.dart';
import 'package:my_flutter_apps/features/amount_splitter/presentation/bloc/amount_splitter_bloc.dart';
import 'package:my_flutter_apps/features/amount_splitter/presentation/bloc/amount_splitter_event.dart';
import 'package:my_flutter_apps/features/amount_splitter/presentation/bloc/amount_splitter_state.dart';
import 'package:my_flutter_apps/features/amount_splitter/services/splitter.dart';

class AmountSplitterPage extends StatelessWidget {
  const AmountSplitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AmountSplitterBloc>(
      create: (BuildContext context) => AmountSplitterBloc(),
      child: const _AmountSplitterView(),
    );
  }
}

class _AmountSplitterView extends StatelessWidget {
  const _AmountSplitterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amount Splitter')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const _ModeToggle(),
                  const SizedBox(height: 16),
                  const _InputSection(),
                  const SizedBox(height: 16),
                  const _StatsRow(),
                  const SizedBox(height: 16),
                  const _PartsHeader(),
                  const SizedBox(height: 8),
                  // Only the parts list scrolls.
                  const Expanded(child: _PartsList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Owns only the mode toggle. Rebuilds when [SplitterMode] changes.
class _ModeToggle extends StatelessWidget {
  const _ModeToggle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmountSplitterBloc, AmountSplitterState>(
      buildWhen: (AmountSplitterState previous, AmountSplitterState current) =>
          previous.mode != current.mode,
      builder: (BuildContext context, AmountSplitterState state) {
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
          selected: <SplitterMode>{state.mode},
          onSelectionChanged: (Set<SplitterMode> selection) {
            context.read<AmountSplitterBloc>().add(
              AmountSplitterEvent.modeChanged(selection.first),
            );
          },
        );
      },
    );
  }
}

class _InputSection extends StatefulWidget {
  const _InputSection();

  @override
  State<_InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<_InputSection> {
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
              onChanged: (String value) {
                final double? parsed = double.tryParse(value);
                context.read<AmountSplitterBloc>().add(
                  AmountSplitterEvent.amountChanged(
                    (parsed != null && parsed.isFinite) ? parsed : null,
                  ),
                );
              },
            ),
            // Only the fields that depend on mode/allowDecimal live inside
            // a nested builder, so typing in the amount field doesn't rebuild
            // the whole card.
            BlocBuilder<AmountSplitterBloc, AmountSplitterState>(
              buildWhen:
                  (AmountSplitterState previous, AmountSplitterState current) =>
                      previous.mode != current.mode ||
                      previous.allowDecimal != current.allowDecimal ||
                      previous.equalOnly != current.equalOnly ||
                      previous.canSplitRemaining != current.canSplitRemaining,
              builder: (BuildContext context, AmountSplitterState state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (state.mode == SplitterMode.auto) ...<Widget>[
                      const SizedBox(height: 12),
                      TextField(
                        controller: _partCountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Number of parts',
                          hintText: 'e.g. 3',
                        ),
                        onChanged: (String value) {
                          final int? parsed = int.tryParse(value);
                          context.read<AmountSplitterBloc>().add(
                            AmountSplitterEvent.partCountChanged(parsed),
                          );
                        },
                      ),
                    ],
                    const SizedBox(height: 8),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Allow decimals'),
                      value: state.allowDecimal,
                      onChanged: (bool value) {
                        context.read<AmountSplitterBloc>().add(
                          AmountSplitterEvent.allowDecimalToggled(value),
                        );
                      },
                    ),
                    if (state.mode == SplitterMode.auto)
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Equal parts only'),
                        value: state.equalOnly,
                        onChanged: (bool value) {
                          context.read<AmountSplitterBloc>().add(
                            AmountSplitterEvent.equalOnlyToggled(value),
                          );
                        },
                      ),
                    if (state.mode == SplitterMode.manual) ...<Widget>[
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: state.canSplitRemaining
                            ? () {
                                context.read<AmountSplitterBloc>().add(
                                  const AmountSplitterEvent.splitRequested(),
                                );
                              }
                            : null,
                        child: const Text('Split remaining in 2'),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Owns only the three stat values.
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: BlocBuilder<AmountSplitterBloc, AmountSplitterState>(
          buildWhen:
              (AmountSplitterState previous, AmountSplitterState current) =>
                  previous.totalUnits != current.totalUnits ||
                  previous.assignedUnits != current.assignedUnits ||
                  previous.remainingUnits != current.remainingUnits ||
                  previous.allowDecimal != current.allowDecimal,
          builder: (BuildContext context, AmountSplitterState state) {
            final List<(String, String, Color)> items =
                <(String, String, Color)>[
                  (
                    'Total',
                    formatAmount(
                      state.totalUnits,
                      allowDecimal: state.allowDecimal,
                    ),
                    context.colorScheme.onSurface,
                  ),
                  (
                    'Assigned',
                    formatAmount(
                      state.assignedUnits,
                      allowDecimal: state.allowDecimal,
                    ),
                    context.colorScheme.onSurface,
                  ),
                  (
                    'Extra',
                    formatAmount(
                      state.remainingUnits,
                      allowDecimal: state.allowDecimal,
                    ),
                    state.remainingUnits == 0
                        ? context.colorScheme.primary
                        : context.colorScheme.tertiary,
                  ),
                ];
            return Row(
              children: <Widget>[
                for (final (String title, String value, Color color) in items)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title, style: context.textTheme.labelMedium),
                        const SizedBox(height: 4),
                        Text(
                          value,
                          style: context.textTheme.titleLarge?.copyWith(
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Owns the "Parts (n)" header and the "Clear parts" action.
class _PartsHeader extends StatelessWidget {
  const _PartsHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmountSplitterBloc, AmountSplitterState>(
      buildWhen: (AmountSplitterState previous, AmountSplitterState current) =>
          previous.mode != current.mode ||
          previous.visibleParts.length != current.visibleParts.length,
      builder: (BuildContext context, AmountSplitterState state) {
        final bool isManualMode = state.mode == SplitterMode.manual;
        final bool isEmpty = state.visibleParts.isEmpty;
        return Row(
          children: <Widget>[
            Text(
              'Parts',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Chip(label: Text('${state.visibleParts.length}')),
            const Spacer(),
            if (isManualMode)
              TextButton(
                onPressed: isEmpty
                    ? null
                    : () {
                        context.read<AmountSplitterBloc>().add(
                          const AmountSplitterEvent.clearRequested(),
                        );
                      },
                child: const Text('Clear parts'),
              ),
          ],
        );
      },
    );
  }
}

/// The only scrollable part of the page.
class _PartsList extends StatelessWidget {
  const _PartsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmountSplitterBloc, AmountSplitterState>(
      buildWhen: (AmountSplitterState previous, AmountSplitterState current) =>
          previous.mode != current.mode ||
          previous.allowDecimal != current.allowDecimal ||
          previous.totalUnits != current.totalUnits ||
          !identical(previous.visibleParts, current.visibleParts),
      builder: (BuildContext context, AmountSplitterState state) {
        final List<SplitPart> parts = state.visibleParts;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (state.hasTooFewParts) ...<Widget>[
              _TooFewPartsAlert(state: state),
              const SizedBox(height: 8),
            ],
            if (parts.isEmpty)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.colorScheme.outlineVariant,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    state.mode == SplitterMode.manual
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
                  itemCount: parts.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return PartTile(
                      part: parts[index],
                      index: index,
                      totalUnits: state.totalUnits,
                      allowDecimal: state.allowDecimal,
                      mode: state.mode,
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

class _TooFewPartsAlert extends StatelessWidget {
  const _TooFewPartsAlert({required this.state});

  final AmountSplitterState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Only ${state.visibleParts.length} of ${state.targetPartCount} parts '
        'could be made. Each part needs at least the smallest unit '
        '(1, or 0.01 with decimals).',
        style: TextStyle(color: context.colorScheme.onTertiaryContainer),
      ),
    );
  }
}

class PartTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                onPressed: () {
                  context.read<AmountSplitterBloc>().add(
                    AmountSplitterEvent.removeRequested(part.id),
                  );
                },
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
                    ? () {
                        context.read<AmountSplitterBloc>().add(
                          AmountSplitterEvent.divideRequested(part.id),
                        );
                      }
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
