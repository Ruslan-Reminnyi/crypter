part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
Dio chartDio(Ref ref) => Dio(
  BaseOptions(
    baseUrl: ref.watch(chartBaseUrlProvider),
    connectTimeout: DiConstants.connectTimeout,
    receiveTimeout: DiConstants.receiveTimeout,
  ),
);
