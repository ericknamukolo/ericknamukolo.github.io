import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final Function() click;
  final bool isSending;

  const BasicButton({
    Key? key,
    required this.text,
    required this.click,
    this.isSending = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: click,
        child: Container(
          height: 50,
          width: 160,
          child: Center(
            child: isSending
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    text,
                    style: kNormalTextStyleWhite,
                  ),
          ),
          decoration: BoxDecoration(
            color: isSending ? Colors.grey : kprimaryColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 6),
                color: const Color(0xff000000).withOpacity(.16),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
