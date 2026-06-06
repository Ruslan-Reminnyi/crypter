import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final List<T> values;
  final T initialSelection;
  final String Function(T) itemBuilder;
  final ValueChanged<T?> onSelected;
  final double width;

  const CustomDropdownMenu({
    super.key,
    required this.values,
    required this.initialSelection,
    required this.itemBuilder,
    required this.onSelected,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      dropdownMenuEntries: values
          .map((T value) => DropdownMenuEntry<T>(value: value, label: itemBuilder(value)))
          .toList(),
      initialSelection: initialSelection,
      onSelected: (value) => onSelected(value),
      width: width,
    );
  }
}
