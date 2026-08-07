import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppDialog {
  static Future<bool?> orderDeletion(BuildContext context) => _show(
    context: context,
    title: context.l10n.areYouSure,
    content: context.l10n.doYouWantToDeleteOrder,
    cancelText: context.l10n.cancel,
    confirmText: context.l10n.delete,
  );

  static Future<bool?> logout(BuildContext context) => _show(
    context: context,
    title: context.l10n.areYouSure,
    content: context.l10n.doYouWantToLogout,
    cancelText: context.l10n.cancel,
    confirmText: context.l10n.logout,
  );

  static Future<bool?> requestPermission(BuildContext context) => _show(
    context: context,
    title: context.l10n.getStopLossThresholdAlerts,
    content: context.l10n.wouldYouLikeToGetNotificationsAboutStopLoss,
    cancelText: context.l10n.cancel,
    confirmText: context.l10n.receive,
  );

  static Future<bool?> _show({
    required BuildContext context,
    required String title,
    required String content,
    required String cancelText,
    required String confirmText,
    bool barrierDismissable = true,
  }) {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: barrierDismissable,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () => context.pop(false), child: Text(cancelText)),
          TextButton(onPressed: () => context.pop(true), child: Text(confirmText)),
        ],
      ),
    );
  }
}
