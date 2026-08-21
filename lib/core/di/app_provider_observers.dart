import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

class AppProviderObservers {
  final List<ProviderObserver> observers;

  AppProviderObservers(Talker talker) : observers = [] {
    final talkerRiverpodObserver = TalkerRiverpodObserver(
      talker: talker,
      settings: TalkerRiverpodLoggerSettings(printProviderDisposed: true),
    );

    observers.add(talkerRiverpodObserver);
  }
}
