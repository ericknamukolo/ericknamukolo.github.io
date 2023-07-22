import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';

import '../constants/colors.dart';
import '../desktop/widgets/icon_hover.dart';

class ProjectIconBtn extends StatelessWidget {
  final IconData icon;
  final String link;
  final double? padding;
  const ProjectIconBtn({
    Key? key,
    required this.icon,
    required this.link,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: link.isNotEmpty,
      child: IconHover(
        icon: icon,
        color: kprimaryColor,
        click: () => AppData.goToLink(link),
        padding: padding ?? 0,
      ),
    );
  }
}
