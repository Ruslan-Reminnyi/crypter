// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_info_repo_stream.dart';

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

String _$candlesHash() => r'9090362be5b41da3364b9b75617b8cc90e1906be';
