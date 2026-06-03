import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppStorageModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
