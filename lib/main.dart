import 'package:crypter/core/launch.dart';
import 'package:crypter/presentation/features/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await launch();
  runApp(const App());
}
