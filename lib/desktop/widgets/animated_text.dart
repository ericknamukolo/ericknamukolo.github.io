import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class AnimatedTexttt extends StatefulWidget {
  final String text;
  final Function()? click;
  final double width;
  const AnimatedTexttt({
    Key? key,
    required this.text,
    this.click,
    this.width = 0,
  }) : super(key: key);

  @override
  State<AnimatedTexttt> createState() => _AnimatedTextttState();
}

class _AnimatedTextttState extends State<AnimatedTexttt> {
  Color color = Colors.white;
  FontWeight? bold;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          color = kprimaryColor;
          bold = FontWeight.bold;
        });
      },
      onExit: (_) {
        setState(() {
          color = Colors.white;
          bold = null;
        });
      },
      child: GestureDetector(
        onTap: widget.click,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: kNormalTextStyleWhite.copyWith(
                color: color,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.ease,
              width: widget.width,
              height: 5,
              color: kprimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
