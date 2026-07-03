import 'package:crypter/core/app/config/app_config.dart';
import 'package:crypter/core/di/async_app_dependencies.dart';
import 'package:crypter/core/app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<AsyncAppDependencies> launch() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final appConfig = AppConfig.fromEnvironment();
  final asyncAppDependencies = await AsyncAppDependencies.init(appConfig);

  return asyncAppDependencies;
}
