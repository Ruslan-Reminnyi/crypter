import 'package:crypter/core/di/async_app_dependencies.dart';
import 'package:crypter/presentation/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final asyncAppDependencies = await AsyncAppDependencies.init();

  runApp(ProviderScope(overrides: asyncAppDependencies.overrides, child: const App()));
}
