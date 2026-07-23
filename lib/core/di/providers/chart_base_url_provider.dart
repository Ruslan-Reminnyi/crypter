part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
String chartBaseUrl(Ref _) => AppConfig.fromEnvironment().chartBaseUrl;
