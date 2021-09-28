import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class AnimatedTexttt extends StatefulWidget {
  final String text;
  final Function() click;
  const AnimatedTexttt({
    Key? key,
    required this.text,
    required this.click,
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
      child: GestureDetector(
        onTap: widget.click,
        child: Text(
          widget.text,
          style: kNormalTextStyleWhite.copyWith(
            color: color,
          ),
        ),
      ),
    );
  }
}
