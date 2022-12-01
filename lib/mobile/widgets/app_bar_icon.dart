import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../constants/colors.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final Function() click;
  const AppBarIcon({
    Key? key,
    required this.icon,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: kdarkColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
