part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
String apiBaseUrl(Ref _) => AppConfig.fromEnvironment().apiBaseUrl;
