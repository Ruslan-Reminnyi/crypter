part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
  ref.watch(apiDioProvider),
  ref.watch(sharedPreferencesServiceProvider),
  ref.watch(talkerProvider),
);
