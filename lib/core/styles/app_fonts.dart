import 'package:flutter/material.dart';

abstract class AppFontStyles {
  static const String primaryFont = 'SpaceGrotesk';

  static const double displayLarge = 57.0;
  static const double displayMedium = 45.0;
  static const double displaySmall = 36.0;

  static const double headlineLarge = 32.0;
  static const double headlineMedium = 28.0;
  static const double headlineSmall = 24.0;

  static const double titleLarge = 22.0;
  static const double titleMedium = 16.0;
  static const double titleSmall = 14.0;

  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;

  static const double labelLarge = 14.0;
  static const double labelMedium = 12.0;
  static const double labelSmall = 11.0;

  static const double timerDisplay = 72.0;
  static const double appBarTitle = 24.0;
  static const double buttonText = 18.0;
  static const double cardTitle = 18.0;
  static const double settingsTitle = 24.0;
  static const double settingsItem = 16.0;
  static const double sessionInfo = 16.0;
  static const double smallSize = 12.0;
  static const double mediumSize = 14.0;
  static const double largeSize = 16.0;

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  static const double tightLineHeight = 1.0;
  static const double normalLineHeight = 1.2;
  static const double relaxedLineHeight = 1.4;
  static const double looseLineHeight = 1.6;

  static const double tightSpacing = -0.5;
  static const double normalSpacing = 0.0;
  static const double wideSpacing = 0.5;
  static const double extraWideSpacing = 1.0;

  static String get fontFamily => primaryFont;
}

abstract class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: AppFontStyles.headlineLarge,
    fontWeight: AppFontStyles.bold,
    letterSpacing: AppFontStyles.tightSpacing,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: AppFontStyles.titleMedium,
    fontWeight: AppFontStyles.semiBold,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: AppFontStyles.titleSmall,
    fontWeight: AppFontStyles.regular,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppFontStyles.bodyMedium,
    fontWeight: AppFontStyles.regular,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppFontStyles.bodySmall,
    fontWeight: AppFontStyles.medium,
    letterSpacing: AppFontStyles.extraWideSpacing,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle bodyTextLarge = TextStyle(
    fontSize: AppFontStyles.bodyLarge,
    fontWeight: AppFontStyles.regular,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle bodyTextSmall = TextStyle(
    fontSize: AppFontStyles.bodySmall,
    fontWeight: AppFontStyles.regular,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontStyles.buttonText,
    fontWeight: AppFontStyles.semiBold,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: AppFontStyles.mediumSize,
    fontWeight: AppFontStyles.medium,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle label = TextStyle(
    fontSize: AppFontStyles.labelMedium,
    fontWeight: AppFontStyles.medium,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: AppFontStyles.labelSmall,
    fontWeight: AppFontStyles.regular,
    fontFamily: AppFontStyles.primaryFont,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: AppFontStyles.labelLarge,
    fontWeight: AppFontStyles.bold,
    fontFamily: AppFontStyles.primaryFont,
  );
}
