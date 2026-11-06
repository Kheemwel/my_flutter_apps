// lib/core/extensions/theme_x.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/theme/accent_families.dart';

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  AccentFamilies get accentFamilies {
    final families = Theme.of(this).extension<AccentFamilies>();
    assert(
      families != null,
      'AccentFamilies not registered in ThemeData.extensions. '
      'Did you forget to add AccentFamilies.forBrightness(...) to your ThemeData?',
    );
    return families!;
  }
}
