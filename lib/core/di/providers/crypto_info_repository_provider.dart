part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
CryptoInfoRepository cryptoInfoRepository(Ref ref) => BinanceCryptoInfoRepository(
  ref.watch(apiDioProvider),
  ref.watch(binanceWebSocketServiceProvider),
  ref.watch(behaviourSubjectProvider),
);
