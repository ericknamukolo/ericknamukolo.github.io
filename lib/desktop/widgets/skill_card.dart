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
  Color color = kdarkColor;
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
                color = kprimaryColor;
                height = 170;
              },
            );
          },
          onExit: (_) {
            setState(
              () {
                color = kdarkColor;
                height = 160;
              },
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
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
