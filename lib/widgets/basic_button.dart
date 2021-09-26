import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 160,
      child: const Center(
        child: Text(
          'Browse Projects',
          style: kNormalTextStyleWhite,
        ),
      ),
      decoration: BoxDecoration(
        color: kprimaryColor,
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
    );
  }
}
