// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_splitter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AmountSplitterNotifier)
final amountSplitterProvider = AmountSplitterNotifierProvider._();

final class AmountSplitterNotifierProvider
    extends $NotifierProvider<AmountSplitterNotifier, AmountSplitterState> {
  AmountSplitterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'amountSplitterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$amountSplitterNotifierHash();

  @$internal
  @override
  AmountSplitterNotifier create() => AmountSplitterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmountSplitterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmountSplitterState>(value),
    );
  }
}

String _$amountSplitterNotifierHash() =>
    r'7cf9dfe4db2ff0dd698cf4a21eada68857270ef8';

abstract class _$AmountSplitterNotifier extends $Notifier<AmountSplitterState> {
  AmountSplitterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AmountSplitterState, AmountSplitterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AmountSplitterState, AmountSplitterState>,
              AmountSplitterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
