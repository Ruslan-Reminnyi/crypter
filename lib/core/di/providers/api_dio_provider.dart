part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
Dio apiDio(Ref ref) =>
    Dio(
        BaseOptions(
          baseUrl: ref.watch(apiBaseUrlProvider),
          connectTimeout: DiConstants.connectTimeout,
          receiveTimeout: DiConstants.receiveTimeout,
          headers: {'Accept': 'application/json'},
        ),
      )
      ..interceptors.addAll([
        AuthInterceptor(ref.watch(sharedPreferencesServiceProvider)),
        NetworkInterceptor(ref.watch(networkServiceProvider), ref.watch(talkerProvider)),
        TalkerDioLogger(
          talker: ref.watch(talkerProvider),
          settings: TalkerDioLoggerSettings(printRequestHeaders: true),
        ),
      ]);
