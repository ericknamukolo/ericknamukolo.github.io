import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class AnimatedTexttt extends StatefulWidget {
  final String text;
  const AnimatedTexttt({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<AnimatedTexttt> createState() => _AnimatedTextttState();
}

class _AnimatedTextttState extends State<AnimatedTexttt> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          color = kprimaryColor;
        });
      },
      onExit: (_) {
        setState(() {
          color = Colors.white;
        });
      },
      child: Text(
        widget.text,
        style: kNormalTextStyleWhite.copyWith(
          color: color,
        ),
      ),
    );
  }
}
