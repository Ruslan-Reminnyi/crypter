// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_info_repository_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(candles)
final candlesProvider = CandlesProvider._();

final class CandlesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Candle>>,
          List<Candle>,
          Stream<List<Candle>>
        >
    with $FutureModifier<List<Candle>>, $StreamProvider<List<Candle>> {
  CandlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'candlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$candlesHash();

  @$internal
  @override
  $StreamProviderElement<List<Candle>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Candle>> create(Ref ref) {
    return candles(ref);
  }
}

String _$candlesHash() => r'5a21bd82cb8b0e6ed5f61cf29eba710d13c43f3a';
