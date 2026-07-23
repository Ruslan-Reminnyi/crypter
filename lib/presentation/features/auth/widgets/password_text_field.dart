import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this._controller,
    required this.hintText,
    required this.validator,
    this.textInputAction,
  });

  final TextEditingController _controller;
  final String hintText;
  final String? Function(String?) validator;
  final TextInputAction? textInputAction;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isTextObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () => setState(() {
            _isTextObscure = !_isTextObscure;
          }),
          icon: Icon(_isTextObscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      obscureText: _isTextObscure,
      obscuringCharacter: '*',
      textInputAction: widget.textInputAction ?? .next,
      validator: widget.validator,
    );
  }
}
