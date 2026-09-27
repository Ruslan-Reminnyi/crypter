import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/domain/enums/form_factor.dart';
import 'package:flutter/material.dart';

/// A layout for the full screen according to FormFactor
class AppResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AppResponsiveScreen({super.key, required this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    final formFactor = context.formFactor;

    if (formFactor == FormFactor.desktop && desktop != null) return desktop!;
    if (formFactor == FormFactor.tablet && tablet != null) return tablet!;
    return mobile;
  }
}
