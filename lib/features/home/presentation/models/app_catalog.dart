import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/core/router/routes.dart';
import 'package:my_flutter_apps/core/theme/accent_families.dart';

import 'app_entry.dart';

/// Builds the list of all mini-apps, resolving accent colors from the theme.
List<AppEntry> buildAppCatalog(BuildContext context) {
  final AccentFamilies accents = context.accentFamilies;

  return <AppEntry>[
    AppEntry(
      title: 'Counter',
      description: 'A simple counter with increment, decrement, and reset.',
      icon: Icons.add_circle_outline,
      tags: const <String>['Demo', 'State'],
      accent: accents.blue,
      route: (BuildContext context) => const CounterRoute().push(context),
    ),
    AppEntry(
      title: 'Odds Calculator',
      description: 'Find how many attempts you need for a target chance.',
      icon: Icons.percent,
      tags: const <String>['Math', 'Probability'],
      accent: accents.green,
      route: (BuildContext context) =>
          const OddsCalculatorRoute().push(context),
    ),
    AppEntry(
      title: 'Amount Splitter',
      description: 'Split an amount into equal or custom parts.',
      icon: Icons.call_split,
      tags: const <String>['Math', 'Money', 'Utility'],
      accent: accents.purple,
      route: (BuildContext context) =>
          const AmountSplitterRoute().push(context),
    ),
  ];
}
