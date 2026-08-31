// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AiNotifier)
final aiProvider = AiNotifierProvider._();

final class AiNotifierProvider extends $NotifierProvider<AiNotifier, AiState> {
  AiNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiNotifierHash();

  @$internal
  @override
  AiNotifier create() => AiNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiState>(value),
    );
  }
}

String _$aiNotifierHash() => r'34f058c12876ad98184c8befafca10e0e22ea60c';

abstract class _$AiNotifier extends $Notifier<AiState> {
  AiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AiState, AiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AiState, AiState>,
              AiState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
