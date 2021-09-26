import 'package:flutter/material.dart';
import 'package:portfolio/constants/responsive_breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  final Widget tabletBody;

  const ResponsiveLayout({
    Key? key,
    required this.desktopBody,
    required this.mobileBody,
    required this.tabletBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimension) {
        if (dimension.maxWidth < kTabletBreakpoint) {
          return mobileBody;
        } else if (dimension.maxWidth >= kTabletBreakpoint &&
            dimension.maxWidth < kCustomSize) {
          return tabletBody;
        } else if (dimension.maxWidth >= kCustomSize) {
          return desktopBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
