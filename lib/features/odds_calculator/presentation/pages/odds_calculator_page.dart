import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/core/theme/accent_family.dart';
import 'package:my_flutter_apps/core/utils/debouncer.dart';
import 'package:my_flutter_apps/features/odds_calculator/presentation/notifier/odds_calculator_notifier.dart';
import 'package:my_flutter_apps/features/odds_calculator/presentation/states/odds_calculator_state.dart';

class OddsCalculatorPage extends StatelessWidget {
  const OddsCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) => const _OddsCalculatorView();
}

class _OddsCalculatorView extends ConsumerWidget {
  const _OddsCalculatorView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Odds Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const _OddsInput(),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: <Widget>[
                    Icon(Icons.insights, color: context.colorScheme.primary),
                    Expanded(
                      child: Text(
                        'Approximate attempts needed for success',
                        style: context.textTheme.titleMedium,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const _AttemptsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AttemptsSection extends ConsumerWidget {
  const _AttemptsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OddsCalculatorState state = ref.watch(oddsCalculatorProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: <Widget>[
        _AttemptsDisplay(
          attempts: state.attempts(30),
          targetChance: 30,
          description: 'Low likelihood',
          accentFamily: context.accentFamilies.red,
        ),
        _AttemptsDisplay(
          attempts: state.attempts(50),
          targetChance: 50,
          description: 'Median coinflip probability',
          accentFamily: context.accentFamilies.yellow,
        ),
        _AttemptsDisplay(
          attempts: state.attempts(90),
          targetChance: 90,
          description: 'High confidence rate',
          accentFamily: context.accentFamilies.blue,
        ),
        _AttemptsDisplay(
          attempts: state.attempts(99),
          targetChance: 99,
          description: 'Near certainty',
          accentFamily: context.accentFamilies.green,
        ),
      ],
    );
  }
}

class _OddsInput extends ConsumerStatefulWidget {
  const _OddsInput();

  @override
  ConsumerState<_OddsInput> createState() => _OddsInputState();
}

class _OddsInputState extends ConsumerState<_OddsInput> {
  final TextEditingController _oddsText = TextEditingController(text: '50');
  final Debouncer _debounce = Debouncer();
  double _sliderValue = 50;

  @override
  void dispose() {
    _debounce.dispose();
    _oddsText.dispose();
    super.dispose();
  }

  void _pushChance(double chance) {
    ref.read(oddsCalculatorProvider.notifier).chanceChanged(chance);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surfaceContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: <Widget>[
          Focus(
            onFocusChange: (bool hasFocus) {
              if (hasFocus) return;
              final double? value = double.tryParse(_oddsText.text);
              final double clamped = (value ?? 0.01).clamp(0.01, 99);
              final String formatted = clamped.toString();
              if (formatted != _oddsText.text) {
                _oddsText.value = TextEditingValue(
                  text: formatted,
                  selection: TextSelection.collapsed(offset: formatted.length),
                );
              }
              setState(() => _sliderValue = clamped);
              _pushChance(clamped);
            },
            child: TextField(
              style: context.textTheme.displaySmall,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[_PositiveAmountFormatter()],
              controller: _oddsText,
              decoration: InputDecoration(
                suffixText: '%',
                labelText: 'Probability/Chance (%)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: context.colorScheme.surface,
              ),
              onChanged: (String newValue) {
                final double chance = (double.tryParse(newValue) ?? 0).clamp(
                  0.01,
                  99,
                );
                setState(() => _sliderValue = chance);
                _debounce(() => _pushChance(chance));
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Slider(
                min: 0.01,
                max: 99,
                value: _sliderValue,
                onChanged: (double newValue) {
                  final String text = _formatAmount(newValue);
                  _oddsText.value = TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  );
                  setState(() => _sliderValue = newValue);
                },
                onChangeEnd: _pushChance,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('0.01%', style: context.textTheme.labelSmall),
                    Text('99%', style: context.textTheme.labelSmall),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AttemptsDisplay extends StatelessWidget {
  final int attempts;
  final int targetChance;
  final String description;
  final AccentFamily accentFamily;

  const _AttemptsDisplay({
    required this.attempts,
    required this.targetChance,
    required this.description,
    required this.accentFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Narrow: stack number below the description
          final bool isNarrow = constraints.maxWidth < 360;

          final Row content = Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentFamily.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.percent,
                  color: accentFamily.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '$targetChance% Chance',
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

          final Row attemptsLabel = Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                attempts.toString(),
                style: context.textTheme.displaySmall?.copyWith(
                  color: accentFamily.primary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'attempt${attempts > 1 ? 's' : ''}',
                style: context.textTheme.labelLarge,
              ),
            ],
          );

          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                content,
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(fit: BoxFit.scaleDown, child: attemptsLabel),
                ),
              ],
            );
          }

          return Row(
            children: <Widget>[
              Expanded(child: content),
              const SizedBox(width: 12),
              FittedBox(fit: BoxFit.scaleDown, child: attemptsLabel),
            ],
          );
        },
      ),
    );
  }
}

// formatter — structure only
class _PositiveAmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String cleaned = _sanitize(newValue.text);
    if (cleaned == newValue.text) return newValue;
    return TextEditingValue(
      text: cleaned,
      selection: TextSelection.collapsed(offset: cleaned.length),
    );
  }

  String _sanitize(String text) {
    final StringBuffer buf = StringBuffer();
    bool seenDot = false;
    for (final String ch in text.split('')) {
      if (ch == '.') {
        if (seenDot) continue;
        seenDot = true;
        buf.write(ch);
      } else if (RegExp(r'\d').hasMatch(ch)) {
        buf.write(ch);
      }
    }
    return buf.toString();
  }
}

String _formatAmount(double v) {
  // Round to a sane precision to avoid FP noise like 99.00000000001
  final double rounded = double.parse(v.toStringAsFixed(2));

  // If it's an integer, show no decimals: 99, 0
  if (rounded == rounded.truncateToDouble()) {
    return rounded.toInt().toString();
  }

  // Otherwise, show up to 2 decimals, trimming trailing zeros:
  // 12.50 → 12.5, 12.34 → 12.34, 0.01 → 0.01
  String s = rounded.toStringAsFixed(2);
  while (s.endsWith('0')) {
    s = s.substring(0, s.length - 1);
  }
  if (s.endsWith('.')) {
    s = s.substring(0, s.length - 1);
  }
  return s;
}
