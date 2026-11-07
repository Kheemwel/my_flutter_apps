import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/core/router/routes.dart';
import 'package:my_flutter_apps/core/theme/accent_family.dart';
import 'package:my_flutter_apps/core/utils/debouncer.dart';
import 'package:my_flutter_apps/features/odds_calculator/presentation/bloc/odds_calculator_bloc.dart';
import 'package:my_flutter_apps/features/odds_calculator/presentation/bloc/odds_calculator_event.dart';
import 'package:my_flutter_apps/features/odds_calculator/presentation/bloc/odds_calculator_state.dart';

class OddsCalculatorPage extends StatelessWidget {
  const OddsCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OddsCalculatorBloc(),
      child: _OddsCalculatorView(),
    );
  }
}

class _OddsCalculatorView extends StatelessWidget {
  const _OddsCalculatorView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => HomeRoute().go(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Odds Finder'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 750),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _OddsInput(),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Icon(Icons.insights, color: context.colorScheme.primary),
                    Text(
                      'Approximate attempts needed for success',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                BlocBuilder<OddsCalculatorBloc, OddsCalculatorState>(
                  builder: (context, state) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 12,
                    children: [
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OddsInput extends StatefulWidget {
  const _OddsInput();

  @override
  State<_OddsInput> createState() => _OddsInputState();
}

class _OddsInputState extends State<_OddsInput> {
  final TextEditingController _oddsText = TextEditingController(text: '50');
  final Debouncer _debounce = Debouncer();
  double _sliderValue = 50;

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 32, 24, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surfaceContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
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
              context.read<OddsCalculatorBloc>().add(
                OddsCalculatorEvent.chanceChanged(clamped),
              );
            },
            child: TextField(
              style: context.textTheme.displaySmall,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [_PositiveAmountFormatter()],
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
              onChanged: (newValue) {
                final double chance = (double.tryParse(newValue) ?? 0).clamp(
                  0.01,
                  99,
                );
                setState(() => _sliderValue = chance);
                _debounce(() {
                  context.read<OddsCalculatorBloc>().add(
                    OddsCalculatorEvent.chanceChanged(chance),
                  );
                });
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Slider(
                min: 0.01,
                max: 99,
                value: _sliderValue,
                onChanged: (newValue) {
                  final text = _formatAmount(newValue);
                  _oddsText.value = TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  );
                  setState(() => _sliderValue = newValue);
                },
                onChangeEnd: (newValue) {
                  context.read<OddsCalculatorBloc>().add(
                    OddsCalculatorEvent.chanceChanged(newValue),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentFamily.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.percent, color: accentFamily.onPrimaryContainer),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text(
                '$targetChance% Chance',
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                attempts.toString(),
                style: context.textTheme.displaySmall?.copyWith(
                  color: accentFamily.primary,
                ),
              ),
              Text(
                'attempt${attempts > 1 ? 's' : ''}',
                style: context.textTheme.labelLarge,
              ),
            ],
          ),
        ],
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
    final cleaned = _sanitize(newValue.text);
    if (cleaned == newValue.text) return newValue;
    return TextEditingValue(
      text: cleaned,
      selection: TextSelection.collapsed(offset: cleaned.length),
    );
  }

  String _sanitize(String text) {
    final buf = StringBuffer();
    var seenDot = false;
    for (final ch in text.split('')) {
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
  final rounded = double.parse(v.toStringAsFixed(2));

  // If it's an integer, show no decimals: 99, 0
  if (rounded == rounded.truncateToDouble()) {
    return rounded.toInt().toString();
  }

  // Otherwise, show up to 2 decimals, trimming trailing zeros:
  // 12.50 → 12.5, 12.34 → 12.34, 0.01 → 0.01
  var s = rounded.toStringAsFixed(2);
  while (s.endsWith('0')) {
    s = s.substring(0, s.length - 1);
  }
  if (s.endsWith('.')) {
    s = s.substring(0, s.length - 1);
  }
  return s;
}
