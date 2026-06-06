import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The class that avoids dealing with Riverpod-specific types such as AsyncValue.
/// Async dependencies initialized before the app launch and than the providers overridden by them.
class AsyncAppDependencies {
  final SharedPreferences _sharedPreferences;

  AsyncAppDependencies._({required this._sharedPreferences});

  static Future<AsyncAppDependencies> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return AsyncAppDependencies._(sharedPreferences: sharedPreferences);
  }

  List<Override> get overrides => [sharedPreferencesProvider.overrideWithValue(_sharedPreferences)];
}
