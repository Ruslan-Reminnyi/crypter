import 'package:crypter/core/styles/app_fonts.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

const double kHeight = 50.0;

class AppButton extends StatelessWidget {
  final VoidCallback _callback;
  final String _label;
  final Color? _color;
  final double? _width;
  final double? _height;
  final IconData? _suffixIcon;
  final IconData? _prefixIcon;
  final Color? _labelColor;
  final Color? _borderColor;
  final Gradient? _gradient;

  const AppButton({
    super.key,
    required this._callback,
    required this._label,
    this._color,
    this._width,
    this._height,
    this._suffixIcon,
    this._prefixIcon,
    this._labelColor,
    this._borderColor,
    this._gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callback,
      child: Container(
        height: context.responsiveValue(
          mobile: () => _height ?? kHeight,
          tablet: () => _height ?? kHeight,
          desktop: () => _height ?? kHeight,
        ),
        width: _width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          border: Border.all(color: _borderColor ?? Theme.of(context).colorScheme.primary),
          color: _color ?? Theme.of(context).colorScheme.primary,
          gradient: _gradient,
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            if (_prefixIcon != null) ...[
              Icon(_prefixIcon, color: _labelColor ?? context.colors.labelLarge),
              SizedBox(width: 4.0),
            ],
            Text(
              _label,
              style: AppTextStyles.button.copyWith(
                color: _labelColor ?? context.colors.labelLarge,
                height: 1.25,
              ),
            ),
            if (_suffixIcon != null) ...[
              SizedBox(width: 4.0),
              Icon(_suffixIcon, color: _labelColor ?? context.colors.labelLarge),
            ],
          ],
        ),
      ),
    );
  }
}
