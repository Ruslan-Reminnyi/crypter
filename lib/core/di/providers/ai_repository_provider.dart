part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
AiRepository aiRepository(Ref ref) =>
    AiRepositoryImpl(ref.watch(apiDioProvider), ref.watch(sharedPreferencesServiceProvider));
