import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class MProjectsAndDesigns extends StatelessWidget {
  const MProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 900,
      width: double.infinity,
      color: klightDarkColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: const [
                Text(
                  'Projects & Designs',
                  style: kMiniTitleTextStyleWhite,
                ),
                Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 250,
                  indent: 250,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
