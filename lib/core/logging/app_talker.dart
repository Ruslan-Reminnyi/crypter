import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppTalker {
  final Talker talker;

  AppTalker() : talker = TalkerFlutter.init(observer: _CrashlyticsTalkerObserver());
}

class _CrashlyticsTalkerObserver extends TalkerObserver {
  @override
  void onError(TalkerError err) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordError(err.error, err.stackTrace, reason: err.message);
    }

    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordError(
        err.exception,
        err.stackTrace,
        reason: err.message,
        fatal: true,
      );
    }

    super.onException(err);
  }

  @override
  void onLog(TalkerData err) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.log("${err.error}");
    }

    super.onLog(err);
  }
}
