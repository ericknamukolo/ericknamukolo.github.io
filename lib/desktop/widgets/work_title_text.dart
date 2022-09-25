import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class WorkTitleText extends StatelessWidget {
  final String title;
  final bool isMobile;
  final bool isHovered;
  const WorkTitleText({
    Key? key,
    required this.title,
    this.isMobile = false,
    this.isHovered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '@',
              style: kNormalTextStyleWhite.copyWith(
                color: kprimaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kNormalTextStyleWhite.copyWith(
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.bounceOut,
                  height: 2,
                  width: isHovered ? 160.0 : 50,
                  color: kprimaryColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
