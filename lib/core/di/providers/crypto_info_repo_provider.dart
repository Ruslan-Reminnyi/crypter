part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
CryptoInfoRepo cryptoInfoRepo(Ref ref) => BinanceCryptoInfoRepo(
  ref.watch(dioProvider),
  ref.watch(binanceWebSocketServiceProvider),
  ref.watch(behaviourSubjectProvider),
);
