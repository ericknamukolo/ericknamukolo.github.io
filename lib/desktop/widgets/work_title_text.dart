import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class WorkTitleText extends StatefulWidget {
  final String title;
  final bool isMobile;
  const WorkTitleText({
    Key? key,
    required this.title,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<WorkTitleText> createState() => _WorkTitleTextState();
}

class _WorkTitleTextState extends State<WorkTitleText> {
  double lineWidth = 50.0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          lineWidth = 150.0;
        });
      },
      onExit: (_) {
        setState(() {
          lineWidth = 50.0;
        });
      },
      child: Column(
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
                    widget.title,
                    style: kNormalTextStyleWhite.copyWith(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: widget.isMobile ? 14 : 16,
                    ),
                  ),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.bounceOut,
                      height: 1,
                      width: lineWidth,
                      color: kprimaryColor),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
