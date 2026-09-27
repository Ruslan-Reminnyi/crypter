import 'package:crypter/data/extensions/constraints_extensions.dart';
import 'package:crypter/domain/enums/form_factor.dart';
import 'package:flutter/material.dart';

/// A layout for the part of the screen according to FormFactor
class AppResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, FormFactor formFactor) builder;

  const AppResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final formFactor = constraints.formFactor;

      if (formFactor == FormFactor.desktop) return builder(context, FormFactor.desktop);
      if (formFactor == FormFactor.tablet) return builder(context, FormFactor.tablet);
      return builder(context, FormFactor.mobile);
    },
  );
}
