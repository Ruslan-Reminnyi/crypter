// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AiNotifier)
final aiProvider = AiNotifierProvider._();

final class AiNotifierProvider
    extends $NotifierProvider<AiNotifier, List<AiRecommendation>> {
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
  Override overrideWithValue(List<AiRecommendation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AiRecommendation>>(value),
    );
  }
}

String _$aiNotifierHash() => r'a2c874144bfaacd84990970b6fb3118c6170bf96';

abstract class _$AiNotifier extends $Notifier<List<AiRecommendation>> {
  List<AiRecommendation> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<AiRecommendation>, List<AiRecommendation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<AiRecommendation>, List<AiRecommendation>>,
              List<AiRecommendation>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
