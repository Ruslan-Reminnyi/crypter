import 'package:crypter/core/app/launch.dart';
import 'package:crypter/presentation/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final appDependencies = await launch();

  runApp(
    ProviderScope(
      overrides: appDependencies.overrides,
      observers: appDependencies.observers,
      child: const App(),
    ),
  );
}
