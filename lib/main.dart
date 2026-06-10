import 'package:crypter/core/launch.dart';
import 'package:crypter/presentation/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final asyncAppDependencies = await launch();

  runApp(ProviderScope(overrides: asyncAppDependencies.overrides, child: const App()));
}
