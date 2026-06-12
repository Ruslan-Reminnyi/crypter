import 'package:crypter/core/di/async_app_dependencies.dart';
import 'package:crypter/core/app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<AsyncAppDependencies> launch() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final asyncAppDependencies = await AsyncAppDependencies.init();

  return asyncAppDependencies;
}
