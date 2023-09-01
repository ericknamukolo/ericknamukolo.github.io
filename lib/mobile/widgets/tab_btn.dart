import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../models/tab_btn.dart';

class TabBtn extends StatelessWidget {
  final TabButton tab;
  final VoidCallback click;
  const TabBtn({Key? key, required this.tab, required this.click});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: click,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.only(
              right: tab.title.contains('Personal') ? 5 : 0,
              left: tab.title.contains('Work') ? 0 : 5,
            ),
            decoration: tab.isSelected
                ? BoxDecoration(
                    color: kPrimaryColor.withOpacity(.1),
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0))
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                tab.isSelected
                    ? GlowIcon(
                        tab.icon,
                        glowColor: kPrimaryColor,
                        color: kPrimaryColor,
                      )
                    : Icon(tab.icon, color: Color(0xff808080)),
                SizedBox(width: 10),
                Text(tab.title,
                    style: kNormalTextStyleGrey.copyWith(
                        color:
                            tab.isSelected ? Colors.white : Color(0xff808080))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
