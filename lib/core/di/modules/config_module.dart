import 'package:crypter/core/di/constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppConfigModule {
  @Named(DiConstants.apiBaseUrl)
  String get binanceApiBaseUrl => 'https://api.binance.com/';
}
