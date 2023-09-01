import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';

class CVButton extends StatelessWidget {
  const CVButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Projects>(context, listen: false).downloadCV();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 6),
                color: const Color(0xff000000).withOpacity(.16),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'CV',
              style: kNormalTextStyleWhite,
            ),
          ),
        ),
      ),
    );
  }
}
