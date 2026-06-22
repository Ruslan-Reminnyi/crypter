import 'package:crypter/core/di/async_app_dependencies.dart';
import 'package:crypter/core/app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<AsyncAppDependencies> launch() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final asyncAppDependencies = await AsyncAppDependencies.init();

  return asyncAppDependencies;
}
