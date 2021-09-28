import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/project_card.dart';
import 'package:portfolio/widgets/basic_button.dart';

class ProjectsAndDesigns extends StatelessWidget {
  const ProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      height: 1600,
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
          ListView.builder(
            itemBuilder: (context, index) => const ProjectCard(),
            itemCount: 3,
            shrinkWrap: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const BasicButton(
            text: 'Browse All Projects',
          ),
        ],
      ),
    );
  }
}
