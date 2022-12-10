import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/experience.dart';

class WorkTitleText extends StatelessWidget {
  final bool isMobile;
  final Experience work;
  const WorkTitleText({
    Key? key,
    required this.work,
    this.isMobile = false,
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
                  work.workPlace,
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
                  width: work.isHovered ? 160.0 : 50,
                  color: kprimaryColor,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                work.type,
                style: kNormalTextStyleWhite.copyWith(fontSize: 11),
              ),
            )
          ],
        ),
      ],
    );
  }
}
