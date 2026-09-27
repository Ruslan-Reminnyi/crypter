import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField._({
    required this._passwordInputType,
    required this._controller,
    required this.validator,
    this.textInputAction,
  });

  final _PasswordInputType _passwordInputType;
  final TextEditingController _controller;
  final String? Function(String?) validator;
  final TextInputAction? textInputAction;

  factory PasswordTextField.password({
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputAction? textInputAction,
  }) => PasswordTextField._(
    passwordInputType: _PasswordInputType.password,
    controller: controller,
    validator: validator,
    textInputAction: textInputAction,
  );

  factory PasswordTextField.confirmPassword({
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputAction? textInputAction,
  }) => PasswordTextField._(
    passwordInputType: _PasswordInputType.confirmPassword,
    controller: controller,
    validator: validator,
    textInputAction: textInputAction,
  );

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isTextObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
        hintText: widget._passwordInputType.hint(context),
        prefixIcon: Icon(Icons.lock_outline_rounded),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            context.responsiveValue(mobile: () => 12.0, tablet: () => 8.0, desktop: () => 8.0),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () => setState(() {
            _isTextObscure = !_isTextObscure;
          }),
          icon: Icon(
            _isTextObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      obscureText: _isTextObscure,
      obscuringCharacter: '*',
      textInputAction: widget.textInputAction ?? .next,
      validator: widget.validator,
    );
  }
}

enum _PasswordInputType { password, confirmPassword }

extension on _PasswordInputType {
  String hint(BuildContext context) => switch (this) {
    .password => context.l10n.enterPassword,
    .confirmPassword => context.l10n.reenterPassword,
  };
}
