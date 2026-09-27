import 'package:crypter/core/styles/app_colors.dart';
import 'package:crypter/core/styles/app_fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get dark {
    final colors = AppColors.darkColors;

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.primaryContainer,
        tertiary: colors.tertiary,
        onTertiary: colors.primary,
        tertiaryContainer: colors.tertiaryContainer,
        onTertiaryContainer: colors.onTertiaryContainer,
        surface: colors.surface,
        onSurface: colors.primary,
        onSurfaceVariant: colors.onSurfaceVariant,
        outline: colors.outline,
        inverseSurface: colors.inverseSurface,
      ),
      scaffoldBackgroundColor: colors.scaffoldBackground,
      fontFamily: 'System',

      appBarTheme: AppBarThemeData(
        centerTitle: false,
        titleTextStyle: TextStyle(color: colors.inverseSurface, fontSize: 22.0),
      ),

      iconTheme: IconThemeData(color: colors.onPrimary),

      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(iconColor: WidgetStatePropertyAll(colors.inverseSurface)),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(colors.primary),
          shape: WidgetStatePropertyAll(LinearBorder()),
        ),
      ),

      inputDecorationTheme: InputDecorationThemeData(
        hintStyle: TextStyle(color: colors.bodySmall),
        prefixIconColor: colors.onPrimary,
        suffixIconColor: colors.onPrimary,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: colors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: colors.tertiary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: colors.tertiary),
        ),
        filled: true,
        fillColor: colors.tertiary,
      ),

      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationThemeData(filled: true, fillColor: colors.surface),
      ),

      tabBarTheme: TabBarThemeData(
        overlayColor: WidgetStateProperty.resolveWith((state) {
          if (state.first == WidgetState.hovered) {
            return colors.primary.withAlpha(50);
          } else if (state.first == WidgetState.selected) {
            return colors.scaffoldBackground;
          }
          return colors.primary;
        }),
        labelStyle: TextStyle(color: colors.inverseSurface),
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(color: colors.primary, borderRadius: BorderRadius.circular(4.0)),
        indicatorSize: .tab,
        unselectedLabelColor: colors.inverseSurface,
        dividerColor: Colors.transparent,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        labelTextStyle: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return TextStyle(color: colors.primary, fontWeight: .w700);
          }
          return TextStyle(color: colors.inverseSurface);
        }),
        indicatorColor: colors.scaffoldBackground,
        height: 70.0,
      ),

      textSelectionTheme: TextSelectionThemeData(cursorColor: colors.primary),

      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.transparent),
        displayMedium: TextStyle(color: Colors.transparent),
        displaySmall: TextStyle(color: Colors.transparent),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: colors.inverseSurface),
        headlineMedium: TextStyle(color: Colors.transparent),
        headlineSmall: TextStyle(color: Colors.transparent),
        titleLarge: TextStyle(color: Colors.transparent),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: colors.primary),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: colors.inverseSurface),
        bodyLarge: TextStyle(color: Colors.transparent),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: colors.onPrimary),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: colors.bodySmall),
        labelLarge: AppTextStyles.labelLarge.copyWith(color: colors.labelLarge),
        labelMedium: TextStyle(color: Colors.transparent),
        labelSmall: TextStyle(color: Colors.transparent),
      ),
    );
  }
}
