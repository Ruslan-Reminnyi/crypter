part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
Dio dio(Ref ref) => Dio(
  BaseOptions(
    baseUrl: ref.watch(binanceApiBaseUrlProvider),
    connectTimeout: DiConstants.connectTimeout,
    receiveTimeout: DiConstants.receiveTimeout,
  ),
);
