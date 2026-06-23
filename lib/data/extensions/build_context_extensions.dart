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
