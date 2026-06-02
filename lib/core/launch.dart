import 'package:crypter/core/di/configuration.dart';
import 'package:flutter/cupertino.dart';

Future<void> launch() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
}
