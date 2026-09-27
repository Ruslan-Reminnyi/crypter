import 'package:crypter/core/styles/app_colors.dart';
import 'package:crypter/domain/enums/form_factor.dart';
import 'package:crypter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppLocalizationsType on BuildContext {
  AppLocalizations get l10n {
    final appLocalizations = AppLocalizations.of(this);
    if (appLocalizations != null) {
      return appLocalizations;
    }

    return lookupAppLocalizations(AppLocalizations.supportedLocales[0]);
  }
}

extension ResponsiveContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get screenWidth => size.width;
  double get screenHeight => size.height;

  FormFactor get formFactor => FormFactor.fromWidth(screenWidth);

  T responsiveValue<T>({
    required T Function() mobile,
    T Function()? tablet,
    T Function()? desktop,
  }) {
    if (formFactor == FormFactor.desktop) return desktop?.call() ?? tablet?.call() ?? mobile();
    if (formFactor == FormFactor.tablet) return tablet?.call() ?? mobile();
    return mobile();
  }
}

extension ColorsType on BuildContext {
  AppColorScheme get colors => AppColors.of(this);
}
