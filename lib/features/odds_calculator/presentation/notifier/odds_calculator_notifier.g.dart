// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odds_calculator_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OddsCalculatorNotifier)
final oddsCalculatorProvider = OddsCalculatorNotifierProvider._();

final class OddsCalculatorNotifierProvider
    extends $NotifierProvider<OddsCalculatorNotifier, OddsCalculatorState> {
  OddsCalculatorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'oddsCalculatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$oddsCalculatorNotifierHash();

  @$internal
  @override
  OddsCalculatorNotifier create() => OddsCalculatorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OddsCalculatorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OddsCalculatorState>(value),
    );
  }
}

String _$oddsCalculatorNotifierHash() =>
    r'13fb9b44143d4a804c0486971f3cb43dcf0883a8';

abstract class _$OddsCalculatorNotifier extends $Notifier<OddsCalculatorState> {
  OddsCalculatorState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<OddsCalculatorState, OddsCalculatorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OddsCalculatorState, OddsCalculatorState>,
              OddsCalculatorState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
