import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: klightDarkColor,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: const [
                Icon(
                  MdiIcons.chevronLeft,
                  color: kprimaryColor,
                ),
                Text(
                  'Erick Namukolo',
                  style: kTextStyleWhite,
                ),
                Icon(
                  MdiIcons.chevronRight,
                  color: kprimaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Home',
                  style: kNormalTextStyleWhite,
                ),
                const Text(
                  'About',
                  style: kNormalTextStyleWhite,
                ),
                const Text(
                  'Skills',
                  style: kNormalTextStyleWhite,
                ),
                const Text(
                  'Projects',
                  style: kNormalTextStyleWhite,
                ),
                const Text(
                  'Contact',
                  style: kNormalTextStyleWhite,
                ),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: kprimaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(4, 6),
                        color: const Color(0xff000000).withOpacity(.16),
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Resume',
                      style: kNormalTextStyleWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
