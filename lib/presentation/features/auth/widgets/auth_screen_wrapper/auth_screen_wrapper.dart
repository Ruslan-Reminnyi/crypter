import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/domain/enums/auth_type.dart';
import 'package:crypter/presentation/common/widgets/app_scaffold/app_scaffold.dart';
import 'package:crypter/presentation/features/auth/widgets/auth_footer.dart';
import 'package:crypter/presentation/features/auth/widgets/auth_header.dart';
import 'package:crypter/presentation/features/auth/widgets/cyan_glow.dart';
import 'package:flutter/material.dart';

class AuthScreenWrapper extends StatelessWidget {
  final Widget _form;
  final AuthType _authType;
  final Widget _footer;

  factory AuthScreenWrapper.login({required Widget form, required VoidCallback callback}) =>
      AuthScreenWrapper._(form: form, authType: AuthType.login, footer: AuthFooter.login(callback));

  factory AuthScreenWrapper.signUp({required Widget form, required VoidCallback callback}) =>
      AuthScreenWrapper._(
        form: form,
        authType: AuthType.signUp,
        footer: AuthFooter.signUp(callback),
      );

  const AuthScreenWrapper._({required this._form, required this._authType, required this._footer});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          border: BoxBorder.all(color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.responsiveValue(mobile: () => 0.0, tablet: () => 0.0, desktop: () => 16.0),
            ),
          ),
        ),
        clipBehavior: .antiAlias,
        child: Stack(
          fit: .expand,
          children: [
            CyanGlow.topLeft(),
            CyanGlow.bottomRight(),
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 32.0,
                      children: [
                        AuthHeader(context.l10n.authTitle(_authType.name)),
                        _form,
                        _footer,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
