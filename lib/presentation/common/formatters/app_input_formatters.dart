import 'package:flutter/services.dart';

class AppInputFormatters {
  static List<TextInputFormatter> orderDateTime() {
    return [FilteringTextInputFormatter.allow(RegExp(r'[0-9\- : ]'))];
  }

  static List<TextInputFormatter> orderLeverage() {
    return [FilteringTextInputFormatter.allow(RegExp(r'[0-9:]'))];
  }
}
