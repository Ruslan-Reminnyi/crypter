import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

const double kAppBarHeight = 70.0;
const double kDesktopScreenWidth = 1224.0;
const double kDesktopScreenHeight = 800.0;

class AppScaffold extends StatelessWidget {
  final Widget _body;
  final Widget? _appBar;
  final Widget? _bottomNavigationBar;

  const AppScaffold({super.key, required this._body, this._bottomNavigationBar, this._appBar});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return Scaffold(
      appBar: _appBar != null
          ? PreferredSize(preferredSize: Size.fromHeight(kAppBarHeight), child: _appBar)
          : null,
      bottomNavigationBar: _bottomNavigationBar,
      body: Center(
        child: SizedBox(
          width: context.responsiveValue(
            mobile: () => screenWidth,
            tablet: () => screenWidth,
            desktop: () => kDesktopScreenWidth,
          ),
          height: context.responsiveValue(
            mobile: () => screenHeight,
            tablet: () => screenHeight,
            desktop: () => kDesktopScreenHeight,
          ),
          child: _body,
        ),
      ),
    );
  }
}
