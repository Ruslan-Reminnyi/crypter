import 'dart:io';

import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/presentation/common/validators/input_error.dart';
import 'package:crypter/presentation/common/validators/validators.dart';
import 'package:crypter/presentation/features/auth/widgets/password_text_field.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: context.l10n.email),
                        keyboardType: .numberWithOptions(decimal: true),
                        textInputAction: .next,
                        validator: (value) {
                          final result = Validators.email(value);

                          return switch (result) {
                            EmptyInputError() => context.l10n.thisIsRequiredField,
                            InvalidEmailFormatError() => context.l10n.emailIsNotValid,
                            _ => null,
                          };
                        },
                      ),
                      SizedBox(height: 16),
                      PasswordTextField(
                        controller: _passwordController,
                        hintText: context.l10n.password,
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
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text(context.l10n.dontHaveAccountYet),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.signUp.path),
                      child: Text(context.l10n.signUp),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                    ),
                    child: Text(context.l10n.login),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final deviceName = await _getDeviceName();

      ref.read(sharedPreferencesServiceProvider).setDeviceName(deviceName);

      await ref.read(authRepositoryProvider).login(email, password, deviceName);

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
