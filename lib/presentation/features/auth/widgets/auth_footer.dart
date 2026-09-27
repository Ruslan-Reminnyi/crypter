import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/domain/enums/auth_type.dart';
import 'package:crypter/presentation/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthFooter extends StatelessWidget {
  final VoidCallback _buttonCallback;
  final AuthType _authType;

  factory AuthFooter.login(VoidCallback buttonCallback) =>
      AuthFooter._(buttonCallback: buttonCallback, authType: AuthType.login);

  factory AuthFooter.signUp(VoidCallback buttonCallback) =>
      AuthFooter._(buttonCallback: buttonCallback, authType: AuthType.signUp);

  const AuthFooter._({required this._buttonCallback, required this._authType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          callback: _buttonCallback,
          label: context.l10n.authButtonLabel(_authType.name),
          suffixIcon: Icons.arrow_forward_rounded,
        ),
        SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: .center,
          children: [
            Text(
              context.l10n.redirectQuestionText(_authType.name),
              style: TextTheme.of(context).bodyMedium?.copyWith(fontWeight: .w500),
            ),
            TextButton(
              onPressed: () => context.go(_authType.route),
              child: Text(context.l10n.redirectActionText(_authType.name)),
            ),
          ],
        ),
      ],
    );
  }
}

extension on AuthType {
  String get route => switch (this) {
    .login => AppRoutes.signUp.path,
    .signUp => AppRoutes.login.path,
  };
}
