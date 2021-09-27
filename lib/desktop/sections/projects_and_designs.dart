import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class ProjectsAndDesigns extends StatelessWidget {
  const ProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      height: 950,
      color: klightDarkColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: const [
                Text(
                  'Projects & Designs',
                  style: kMiniTitleTextStyleWhite,
                ),
                Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 500,
                  indent: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
