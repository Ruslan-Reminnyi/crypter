import 'package:crypter/presentation/common/widgets/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';

const double kContainerHeight = 108.0;

class ParameterSetting<T> extends StatelessWidget {
  final String _label;
  final List<T> _values;
  final Function(T?) _onSelected;
  final String Function(T) _itemBuilder;

  const ParameterSetting({
    super.key,
    required this._label,
    required this._values,
    required this._onSelected,
    required this._itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        height: kContainerHeight,
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: .start,
            spacing: 2.0,
            children: [
              Text(_label.toUpperCase(), style: Theme.of(context).textTheme.bodySmall),
              CustomDropdownMenu<T>(
                values: _values,
                initialSelection: _values[0],
                itemBuilder: _itemBuilder,
                onSelected: _onSelected,
                width: constraints.maxWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
