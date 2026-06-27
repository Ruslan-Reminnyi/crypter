import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showDeletionDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog.adaptive(
      title: Text(context.l10n.areYouSure),
      content: Text(context.l10n.doYouWantToDeleteOrder),
      actions: [
        TextButton(onPressed: () => context.pop(false), child: Text(context.l10n.cancel)),
        TextButton(onPressed: () => context.pop(true), child: Text(context.l10n.delete)),
      ],
    ),
  );
}
