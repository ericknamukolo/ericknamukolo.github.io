import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class SkillCard extends StatefulWidget {
  final String skillName;
  final String path;

  const SkillCard({
    Key? key,
    required this.skillName,
    required this.path,
  }) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  Color color = klightDarkColor;
  double height = 160;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(
              () {
                if (MediaQuery.of(context).size.width >= 1320) {
                  color = const Color(0xff15202B);
                  height = 170;
                } else {
                  color = const Color(0xff15202B);
                }
              },
            );
          },
          onExit: (_) {
            setState(
              () {
                color = klightDarkColor;
                height = 160;
              },
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 750),
            curve: Curves.bounceOut,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 5),
                  color: const Color(0xff000000).withOpacity(.1),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(30.0),
              child: Image.asset(
                widget.path,
              ),
            ),
          ),
        ),
        Text(
          widget.skillName,
          style: kMiniTitleTextStyleWhite,
        ),
      ],
    );
  }
}
