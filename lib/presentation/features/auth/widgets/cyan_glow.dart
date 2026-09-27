import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

const double kMobileTopLeftCyanGlowSize = 800.0;
const double kTabletTopLeftCyanGlowSize = 500.0;
const double kDesktopTopLeftCyanGlowSize = 700.0;
const double kMobileBottomRightCyanGlowSize = 600.0;
const double kTabletBottomRightCyanGlowSize = 700.0;
const double kDesktopBottomRightCyanGlowSize = 900.0;
const double kMobileTopCyanGlowIndent = -400;
const double kTabletTopCyanGlowIndent = -180;
const double kDesktopTopCyanGlowIndent = -350;
const double kMobileLeftCyanGlowIndent = -400;
const double kTabletLeftCyanGlowIndent = -200;
const double kDesktopLeftCyanGlowIndent = -350;
const double kMobileBottomCyanGlowIndent = -130;
const double kTabletBottomCyanGlowIndent = -100;
const double kDesktopBottomCyanGlowIndent = -180;
const double kMobileRightCyanGlowIndent = -320;
const double kTabletRightCyanGlowIndent = -350;
const double kDesktopRightCyanGlowIndent = -450;

class CyanGlow extends StatelessWidget {
  final _CyanGlowType _cyanGlowType;

  const CyanGlow._({required this._cyanGlowType});

  factory CyanGlow.topLeft() => CyanGlow._(cyanGlowType: _CyanGlowType.topLeft);

  factory CyanGlow.bottomRight() => CyanGlow._(cyanGlowType: _CyanGlowType.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _cyanGlowType.top(context),
      left: _cyanGlowType.left(context),
      bottom: _cyanGlowType.bottom(context),
      right: _cyanGlowType.right(context),
      child: SizedBox.square(
        dimension: _cyanGlowType.size(context),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: .circle,
            gradient: RadialGradient(
              colors: [Theme.of(context).colorScheme.primary.withAlpha(80), Colors.transparent],
              stops: [0.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}

enum _CyanGlowType { topLeft, bottomRight }

extension on _CyanGlowType {
  double? top(BuildContext context) => switch (this) {
    .topLeft => context.responsiveValue(
      mobile: () => kMobileTopCyanGlowIndent,
      tablet: () => kTabletTopCyanGlowIndent,
      desktop: () => kDesktopTopCyanGlowIndent,
    ),
    .bottomRight => null,
  };

  double? left(BuildContext context) => switch (this) {
    .topLeft => context.responsiveValue(
      mobile: () => kMobileLeftCyanGlowIndent,
      tablet: () => kTabletLeftCyanGlowIndent,
      desktop: () => kDesktopLeftCyanGlowIndent,
    ),
    .bottomRight => null,
  };

  double? bottom(BuildContext context) => switch (this) {
    .topLeft => null,
    .bottomRight => context.responsiveValue(
      mobile: () => kMobileBottomCyanGlowIndent,
      tablet: () => kTabletBottomCyanGlowIndent,
      desktop: () => kDesktopBottomCyanGlowIndent,
    ),
  };

  double? right(BuildContext context) => switch (this) {
    .topLeft => null,
    .bottomRight => context.responsiveValue(
      mobile: () => kMobileRightCyanGlowIndent,
      tablet: () => kTabletRightCyanGlowIndent,
      desktop: () => kDesktopRightCyanGlowIndent,
    ),
  };

  double size(BuildContext context) => switch (this) {
    .topLeft => context.responsiveValue(
      mobile: () => kMobileTopLeftCyanGlowSize,
      tablet: () => kTabletTopLeftCyanGlowSize,
      desktop: () => kDesktopTopLeftCyanGlowSize,
    ),
    .bottomRight => context.responsiveValue(
      mobile: () => kMobileBottomRightCyanGlowSize,
      tablet: () => kTabletBottomRightCyanGlowSize,
      desktop: () => kDesktopBottomRightCyanGlowSize,
    ),
  };
}
