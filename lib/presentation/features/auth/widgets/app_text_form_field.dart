import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final _TextFormFieldType _textFormFieldType;
  final TextEditingController _controller;
  final String? Function(String?)? _validator;
  final IconData? _prefixIcon;

  const AppTextFormField._({
    required this._textFormFieldType,
    required this._controller,
    this._validator,
    this._prefixIcon,
  });

  factory AppTextFormField.name({
    required TextEditingController controller,
    required String? Function(String?)? validator,
    IconData? prefixIcon,
  }) => AppTextFormField._(
    textFormFieldType: _TextFormFieldType.name,
    controller: controller,
    validator: validator,
    prefixIcon: prefixIcon,
  );

  factory AppTextFormField.email({
    required TextEditingController controller,
    required String? Function(String?)? validator,
    IconData? prefixIcon,
  }) => AppTextFormField._(
    textFormFieldType: _TextFormFieldType.email,
    controller: controller,
    validator: validator,
    prefixIcon: prefixIcon,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
        hintText: _textFormFieldType.hint(context),
        prefixIcon: Icon(_prefixIcon),
      ),
      textInputAction: .next,
      validator: _validator,
    );
  }
}

enum _TextFormFieldType { name, email }

extension on _TextFormFieldType {
  String hint(BuildContext context) => switch (this) {
    .name => context.l10n.enterName,
    .email => context.l10n.enterEmail,
  };
}
