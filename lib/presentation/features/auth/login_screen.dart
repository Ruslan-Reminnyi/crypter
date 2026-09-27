import 'dart:io';

import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/presentation/common/validators/input_error.dart';
import 'package:crypter/presentation/common/validators/validators.dart';
import 'package:crypter/presentation/features/auth/widgets/app_text_form_field.dart';
import 'package:crypter/presentation/features/auth/widgets/auth_screen_wrapper/auth_screen_wrapper.dart';
import 'package:crypter/presentation/features/auth/widgets/password_text_field.dart';
import 'package:crypter/presentation/features/auth/widgets/text_field_with_label.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScreenWrapper.login(
      form: Expanded(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: .center,
            spacing: 16.0,
            children: [
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
              TextFieldWithLabel.password(
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
            ],
          ),
        ),
      ),
      callback: _onSave,
    );
  }

  void _onSave() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final deviceName = await _getDeviceName();

      ref.read(sharedPreferencesServiceProvider).setDeviceName(deviceName);

      try {
        await ref.read(authRepositoryProvider).login(email, password, deviceName);
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
    _emailController.dispose();
    _passwordController.dispose();

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
