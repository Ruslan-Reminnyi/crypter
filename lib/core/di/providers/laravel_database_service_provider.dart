part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
RemoteDatabaseService laravelDatabaseService(Ref ref) => LaravelDatabaseService(
  ref.watch(apiDioProvider),
  ref.watch(sharedPreferencesServiceProvider),
  ref.watch(talkerProvider),
);
