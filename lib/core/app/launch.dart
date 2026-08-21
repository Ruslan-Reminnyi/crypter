import 'package:crypter/core/app/config/app_config.dart';
import 'package:crypter/core/di/app_provider_observers.dart';
import 'package:crypter/core/di/app_async_overrides.dart';
import 'package:crypter/core/app/firebase_options.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/core/logging/app_talker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

Future<({List<Override> overrides, List<ProviderObserver> observers})> launch() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final appConfig = AppConfig.fromEnvironment();

  final talker = AppTalker().talker;

  FlutterError.onError = (errorDetails) {
    talker.handle(errorDetails.exception, errorDetails.stack, "Thrown an uncaught Flutter error");
  };

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    talker.handle(error, stackTrace, "Thrown an uncaught asynchronous error");
    return true;
  };

  final appAsyncOverrides = await AppAsyncOverrides.init(appConfig, talker);

  final overrides = appAsyncOverrides.overrides;
  overrides.add(talkerProvider.overrideWithValue(talker));

  final appProviderObservers = AppProviderObservers(talker);
  final observers = appProviderObservers.observers;

  return (overrides: overrides, observers: observers);
}
