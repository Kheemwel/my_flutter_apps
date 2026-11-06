import 'package:flutter/material.dart';

import 'accent_family.dart';

/// A [ThemeExtension] that carries a set of [AccentFamily]s, one per hue.
///
/// Register it once in [ThemeData.extensions] and read it anywhere via
/// `Theme.of(context).extension<AccentFamilies>()!`.
@immutable
class AccentFamilies extends ThemeExtension<AccentFamilies> {
  const AccentFamilies({
    required this.red,
    required this.orange,
    required this.yellow,
    required this.green,
    required this.blue,
    required this.purple,
    required this.pink,
  });

  final AccentFamily red;
  final AccentFamily orange;
  final AccentFamily yellow;
  final AccentFamily green;
  final AccentFamily blue;
  final AccentFamily purple;
  final AccentFamily pink;

  /// Build the full set from a single [Brightness].
  ///
  /// Pass the same brightness as your app theme so the generated tones match.
  factory AccentFamilies.forBrightness(
    Brightness brightness, {
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
  }) {
    AccentFamily build(Color seed) =>
        AccentFamily.fromSeed(seed, brightness: brightness, variant: variant);

    return AccentFamilies(
      red: build(Colors.red),
      orange: build(Colors.orange),
      // Amber reads better than yellow in dark mode; still "yellow-ish".
      yellow: build(Colors.amber),
      green: build(Colors.green),
      blue: build(Colors.blue),
      purple: build(Colors.purple),
      pink: build(Colors.pink),
    );
  }

  @override
  AccentFamilies copyWith({
    AccentFamily? red,
    AccentFamily? orange,
    AccentFamily? yellow,
    AccentFamily? green,
    AccentFamily? blue,
    AccentFamily? purple,
    AccentFamily? pink,
  }) {
    return AccentFamilies(
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      purple: purple ?? this.purple,
      pink: pink ?? this.pink,
    );
  }

  @override
  AccentFamilies lerp(ThemeExtension<AccentFamilies>? other, double t) {
    if (other is! AccentFamilies) return this;
    return AccentFamilies(
      red: red.lerp(other.red, t),
      orange: orange.lerp(other.orange, t),
      yellow: yellow.lerp(other.yellow, t),
      green: green.lerp(other.green, t),
      blue: blue.lerp(other.blue, t),
      purple: purple.lerp(other.purple, t),
      pink: pink.lerp(other.pink, t),
    );
  }
}
