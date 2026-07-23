import 'dart:io';

import 'package:flutter/foundation.dart';

class AppConfig {
  final int databaseVersion;
  final String chartBaseUrl;
  final String apiBaseUrl;

  AppConfig({required this.databaseVersion, required this.chartBaseUrl, required this.apiBaseUrl});

  factory AppConfig.fromEnvironment() {
    final chartBaseUrl = 'https://api.binance.com/';
    final apiBaseUrl = kIsWeb || Platform.isIOS
        ? 'http://localhost:8080'
        : Platform.isAndroid
        ? 'http://10.0.2.2:8080'
        : 'http://127.0.0.1:8080';
    return AppConfig(databaseVersion: 1, chartBaseUrl: chartBaseUrl, apiBaseUrl: apiBaseUrl);
  }
}
