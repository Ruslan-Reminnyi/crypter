part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
SharedPreferences sharedPreferences(Ref _) =>
    throw UnimplementedError('sharedPreferencesProvider must be initialized'); // to remember not forgetting to override the provider in AsyncAppDependencies
