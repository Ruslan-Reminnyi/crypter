import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_info_repository_stream.g.dart';

@riverpod
Stream<List<Candle>> candles(Ref ref) {
  final cryptoInfoRepository = ref.watch(cryptoInfoRepositoryProvider);
  return cryptoInfoRepository.stream;
}
