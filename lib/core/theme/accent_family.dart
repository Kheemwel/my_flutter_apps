import 'package:flutter/material.dart';

/// A curated subset of roles from a [ColorScheme] generated from a single seed.
///
/// Use this instead of storing a full [ColorScheme] when you only need a
/// handful of coordinated colors from one hue family (e.g. a colored squircle,
/// an accent number, a tinted surface, etc.).
///
/// Every role here comes from the *same* seed, so M3's contrast pairings
/// (e.g. [primary] / [onPrimary], [primaryContainer] / [onPrimaryContainer])
/// are guaranteed to hold.
@immutable
class AccentFamily {
  const AccentFamily({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceContainer,
    required this.onSurfaceVariant,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color surface;
  final Color onSurface;
  final Color surfaceContainer;
  final Color onSurfaceVariant;

  /// Build an [AccentFamily] from a seed color.
  ///
  /// The [brightness] should match your app's theme so the generated
  /// tones are appropriate (lighter on dark, darker on light).
  factory AccentFamily.fromSeed(
    Color seed, {
    Brightness brightness = Brightness.dark,
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
  }) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
      dynamicSchemeVariant: variant,
    );
    return AccentFamily(
      primary: scheme.primary,
      onPrimary: scheme.onPrimary,
      primaryContainer: scheme.primaryContainer,
      onPrimaryContainer: scheme.onPrimaryContainer,
      surface: scheme.surface,
      onSurface: scheme.onSurface,
      surfaceContainer: scheme.surfaceContainer,
      onSurfaceVariant: scheme.onSurfaceVariant,
    );
  }

  /// Interpolate between two [AccentFamily]s — used for theme transitions.
  AccentFamily lerp(AccentFamily other, double t) {
    return AccentFamily(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      onPrimaryContainer: Color.lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
    );
  }

  AccentFamily copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceContainer,
    Color? onSurfaceVariant,
  }) {
    return AccentFamily(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
    );
  }
}
