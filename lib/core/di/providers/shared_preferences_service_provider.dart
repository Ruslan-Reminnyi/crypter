part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
LocalStorageService sharedPreferencesService(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(sharedPreferences);
}
