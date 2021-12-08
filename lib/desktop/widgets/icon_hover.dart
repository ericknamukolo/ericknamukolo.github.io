import 'package:flutter/material.dart';

class IconHover extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Function() click;
  final double? padding;
  const IconHover({
    Key? key,
    required this.icon,
    required this.color,
    required this.click,
    this.padding = 10,
  }) : super(key: key);

  @override
  State<IconHover> createState() => _IconHoverState();
}

class _IconHoverState extends State<IconHover> {
  Color initialColor = const Color(0xffB3A595);
  double size = 40;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          initialColor = widget.color;
          size = 50;
        });
      },
      onExit: (_) {
        setState(() {
          initialColor = const Color(0xffB3A595);
          size = 40;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: widget.padding!),
        child: IconButton(
          icon: Icon(widget.icon, size: 34),
          onPressed: widget.click,
          color: initialColor,
        ),
      ),
    );
  }
}
