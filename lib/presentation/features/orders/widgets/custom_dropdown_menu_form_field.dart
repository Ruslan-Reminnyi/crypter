import 'package:flutter/material.dart';

class CustomDropdownMenuFormField<T> extends StatelessWidget {
  final List<T> values;
  final T initialSelection;
  final String Function(T) itemBuilder;
  final ValueChanged<T?> onSelected;
  final double width;
  final TextEditingController? controller;
  final TextInputAction? _textInputAction;

  const CustomDropdownMenuFormField({
    super.key,
    required this.values,
    required this.initialSelection,
    required this.itemBuilder,
    required this.onSelected,
    required this.width,
    this.controller,
    this._textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuFormField<T>(
      dropdownMenuEntries: values
          .map((T value) => DropdownMenuEntry<T>(value: value, label: itemBuilder(value)))
          .toList(),
      initialSelection: initialSelection,
      onSelected: (value) => onSelected(value),
      width: width,
      controller: controller,
      textInputAction: _textInputAction,
    );
  }
}
