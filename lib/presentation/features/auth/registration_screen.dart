import 'dart:io';

import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/presentation/common/validators/input_error.dart';
import 'package:crypter/presentation/common/validators/validators.dart';
import 'package:crypter/presentation/features/auth/widgets/app_text_form_field.dart';
import 'package:crypter/presentation/features/auth/widgets/auth_screen_wrapper/auth_screen_wrapper.dart';
import 'package:crypter/presentation/features/auth/widgets/text_field_with_label.dart';
import 'package:crypter/presentation/features/auth/widgets/password_text_field.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScreenWrapper.signUp(
      form: Expanded(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: .center,
            spacing: 16.0,
            children: [
              TextFieldWithLabel.name(
                textField: AppTextFormField.name(
                  controller: _nameController,
                  validator: (value) {
                    final result = Validators.name(value);

                    return switch (result) {
                      EmptyInputError() => context.l10n.thisIsRequiredField,
                      _ => null,
                    };
                  },
                  prefixIcon: Icons.person_outline_rounded,
                ),
              ),
              TextFieldWithLabel.email(
                textField: AppTextFormField.email(
                  controller: _emailController,
                  validator: (value) {
                    final result = Validators.email(value);

                    return switch (result) {
                      EmptyInputError() => context.l10n.thisIsRequiredField,
                      InvalidEmailFormatError() => context.l10n.emailIsNotValid,
                      _ => null,
                    };
                  },
                  prefixIcon: Icons.email_outlined,
                ),
              ),
              _PasswordsSection(
                passwordTextField: TextFieldWithLabel.password(
                  textField: PasswordTextField.password(
                    controller: _passwordController,
                    validator: (value) {
                      final result = Validators.password(value);

                      return switch (result) {
                        EmptyInputError() => context.l10n.thisIsRequiredField,
                        InvalidPasswordFormatError() =>
                          context.l10n.passwordMustBeAtLeastEightCharacters,
                        _ => null,
                      };
                    },
                  ),
                ),
                confirmPasswordTextField: TextFieldWithLabel.confirmPassword(
                  textField: PasswordTextField.confirmPassword(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      final result = Validators.confirmPassword(value, _passwordController.text);

                      return switch (result) {
                        EmptyInputError() => context.l10n.thisIsRequiredField,
                        InvalidConfirmPasswordFormatError() => context.l10n.passwordsDoNotMatch,
                        _ => null,
                      };
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      callback: _onSave,
    );
  }

  void _onSave() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final deviceName = await _getDeviceName();

      ref.read(sharedPreferencesServiceProvider).setDeviceName(deviceName);

      try {
        await ref.read(authRepositoryProvider).register(name, email, password, deviceName);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }

      if (mounted) {
        context.go(AppRoutes.chart.path);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  Future<String> _getDeviceName() async {
    final deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      final webBrowserInfo = await deviceInfo.webBrowserInfo;
      return "${webBrowserInfo.browserName.name} (${webBrowserInfo.platform})";
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return '${androidDeviceInfo.brand} ${androidDeviceInfo.model}';
    } else {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return '${iosDeviceInfo.model} ${iosDeviceInfo.utsname}';
    }
  }
}

class _PasswordsSection extends StatelessWidget {
  final Widget _passwordTextField;
  final Widget _confirmPasswordTextField;

  const _PasswordsSection({
    required this._passwordTextField,
    required this._confirmPasswordTextField,
  });

  @override
  Widget build(BuildContext context) {
    final tabletAndMobileLayout = Column(
      crossAxisAlignment: .start,
      spacing: 16.0,
      children: [_passwordTextField, _confirmPasswordTextField],
    );
    final desktopLayout = Row(
      spacing: 24.0,
      children: [
        Expanded(child: _passwordTextField),
        Expanded(child: _confirmPasswordTextField),
      ],
    );

    return context.responsiveValue(
      mobile: () => tabletAndMobileLayout,
      tablet: () => tabletAndMobileLayout,
      desktop: () => desktopLayout,
    );
  }
}
