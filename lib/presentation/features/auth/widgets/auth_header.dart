import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

const double kLogoSize = 62.0;

class AuthHeader extends StatelessWidget {
  final String _title;

  const AuthHeader(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(
          height: context.responsiveValue(
            mobile: () => 16.0,
            tablet: () => 28.0,
            desktop: () => 8.0,
          ),
        ),
        Row(
          spacing: 4.0,
          children: [
            FlutterLogo(size: kLogoSize),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Crypter',
                  style: TextTheme.of(
                    context,
                  ).headlineLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text('Flutter app', style: TextTheme.of(context).titleSmall),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 32.0),
        Text(
          _title,
          style: TextTheme.of(context).headlineLarge?.copyWith(
            fontSize: context.responsiveValue(
              mobile: () => 28.0,
              tablet: () => 32.0,
              desktop: () => 32.0,
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(context.l10n.studySaveOrdersAskForHelp, style: TextTheme.of(context).bodyMedium),
      ],
    );
  }
}
