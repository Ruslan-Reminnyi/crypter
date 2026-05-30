import 'package:crypter/core/di/configuration.dart';
import 'package:crypter/presentation/features/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const App());
}
