part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
Dio apiDio(Ref ref) => Dio(
  BaseOptions(
    baseUrl: ref.watch(apiBaseUrlProvider),
    connectTimeout: DiConstants.connectTimeout,
    receiveTimeout: DiConstants.receiveTimeout,
  ),
);
