part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
NotificationsRepository notificationsRepository(Ref ref) => NotificationsRepositoryImpl(
  ref.watch(sharedPreferencesServiceProvider),
  ref.watch(routerProvider),
  ref.watch(talkerProvider),
);
