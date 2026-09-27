import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  final _TextFieldType _textFieldType;
  final Widget _textField;

  const TextFieldWithLabel._(this._textFieldType, this._textField);

  factory TextFieldWithLabel.name({required Widget textField}) =>
      TextFieldWithLabel._(_TextFieldType.name, textField);

  factory TextFieldWithLabel.email({required Widget textField}) =>
      TextFieldWithLabel._(_TextFieldType.email, textField);

  factory TextFieldWithLabel.password({required Widget textField}) =>
      TextFieldWithLabel._(_TextFieldType.password, textField);

  factory TextFieldWithLabel.confirmPassword({required Widget textField}) =>
      TextFieldWithLabel._(_TextFieldType.confirmPassword, textField);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          _textFieldType.label(context),
          style: TextTheme.of(context).bodyMedium?.copyWith(fontWeight: .w500),
        ),
        SizedBox(height: 2.0),
        _textField,
      ],
    );
  }
}

enum _TextFieldType { name, email, password, confirmPassword }

extension on _TextFieldType {
  String label(BuildContext context) => switch (this) {
    .name => context.l10n.name,
    .email => context.l10n.email,
    .password => context.l10n.password,
    .confirmPassword => context.l10n.confirmPassword,
  };
}
