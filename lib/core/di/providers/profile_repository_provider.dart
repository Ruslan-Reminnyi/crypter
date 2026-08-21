part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) => ProfileRepositoryImpl(
  ref.watch(apiDioProvider),
  ref.watch(sharedPreferencesServiceProvider),
  ref.watch(talkerProvider),
);
