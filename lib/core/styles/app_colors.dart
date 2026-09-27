import 'package:flutter/material.dart';

/// Centralized color management with support for light and dark themes
abstract class AppColors {
  static const Color whiteF1F5F9 = Color(0xFFF1F5F9);

  static const Color grey94A3B8 = Color(0xFF94A3B8);
  static const Color grey64748B = Color(0xFF64748B);
  static const Color grey1F293D = Color(0xFF1F293D);

  static const Color black181C24 = Color(0xFF181C24);
  static const Color black0F131C = Color(0xFF0F131C);
  static const Color black0A0E16 = Color(0xFF0A0E16);
  static const Color black080C14 = Color(0xFF080C14);

  static const Color cyanB6EBFF = Color(0xFFB6EBFF);
  static const Color cyan00D2FF = Color(0xFF00D2FF);

  static const Color violetC1C0FF = Color(0xFFC1C0FF);
  static const Color violet8A5CF5 = Color(0xFF8A5CF5);

  static const DarkColors darkColors = DarkColors();

  /// get colors based on current brightness
  static AppColorScheme of(BuildContext context) => darkColors;

  /// get colors based on brightness value
  static AppColorScheme fromBrightness(Brightness brightness) => darkColors;
}

/// Base class for color schemes
abstract class AppColorScheme {
  const AppColorScheme();

  Color get scaffoldBackground;

  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get tertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get surface;
  Color get onSurfaceVariant;
  Color get inverseSurface;
  Color get outline;

  Color get bodySmall;
  Color get labelLarge;
}

class DarkColors extends AppColorScheme {
  const DarkColors();

  @override
  Color get scaffoldBackground => AppColors.black0F131C;

  @override
  Color get primary => AppColors.cyan00D2FF;

  @override
  Color get onPrimary => AppColors.grey94A3B8;

  @override
  Color get primaryContainer => AppColors.cyanB6EBFF;

  @override
  Color get tertiary => AppColors.grey1F293D;

  @override
  Color get tertiaryContainer => AppColors.violet8A5CF5;

  @override
  Color get onTertiaryContainer => AppColors.violetC1C0FF;

  @override
  Color get surface => AppColors.black0A0E16;

  @override
  Color get onSurfaceVariant => AppColors.black181C24;

  @override
  Color get inverseSurface => AppColors.whiteF1F5F9;

  @override
  Color get outline => Colors.grey.shade700;

  @override
  Color get bodySmall => AppColors.grey64748B;

  @override
  Color get labelLarge => AppColors.black080C14;
}
