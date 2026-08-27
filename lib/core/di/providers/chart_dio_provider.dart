part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
Dio chartDio(Ref ref) =>
    Dio(
        BaseOptions(
          baseUrl: ref.watch(chartBaseUrlProvider),
          connectTimeout: DiConstants.connectTimeout,
          receiveTimeout: DiConstants.receiveTimeout,
          headers: {'Accept': 'application/json'},
        ),
      )
      ..interceptors.addAll([
        NetworkInterceptor(ref.watch(networkServiceProvider), ref.watch(talkerProvider)),
        TalkerDioLogger(
          talker: ref.watch(talkerProvider),
          settings: TalkerDioLoggerSettings(printRequestHeaders: true),
        ),
      ]);
