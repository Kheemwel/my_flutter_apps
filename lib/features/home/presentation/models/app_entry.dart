import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/theme/accent_family.dart';

/// A single mini-app shown on the home grid.
@immutable
class AppEntry {
  const AppEntry({
    required this.title,
    required this.description,
    required this.icon,
    required this.tags,
    required this.accent,
    required this.route,
  });

  final String title;
  final String description;
  final IconData icon;
  final List<String> tags;
  final AccentFamily accent;

  /// Callback that navigates to this app.
  final void Function(BuildContext context) route;
}
