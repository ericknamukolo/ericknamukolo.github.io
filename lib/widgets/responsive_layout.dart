import 'package:flutter/material.dart';
import 'package:portfolio/constants/responsive_breakpoints.dart';
import 'package:portfolio/providers/analytics.dart';
import 'package:portfolio/providers/experiences.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:provider/provider.dart';

import '../services/notification.dart';

class ResponsiveLayout extends StatefulWidget {
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
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    Provider.of<Projects>(context, listen: false).fetchAndSetProjects();
    Provider.of<Skills>(context, listen: false).fetchSkills();
    Provider.of<Experiences>(context, listen: false).fetchWorkData();
    Analytics.trackVisit(NotificationType.visit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimension) {
        if (dimension.maxWidth < kTabletBreakpoint) {
          return widget.mobileBody;
        } else if (dimension.maxWidth >= kTabletBreakpoint &&
            dimension.maxWidth < kCustomSize) {
          return widget.tabletBody;
        } else if (dimension.maxWidth >= kCustomSize) {
          return widget.desktopBody;
        } else {
          return widget.desktopBody;
        }
      },
    );
  }
}
