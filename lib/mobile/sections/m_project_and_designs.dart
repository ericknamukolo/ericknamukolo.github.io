import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/projects_desktop_screen.dart';
import 'package:portfolio/mobile/widgets/single_project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

class MProjectsAndDesigns extends StatelessWidget {
  const MProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectsData = Provider.of<Projects>(context).projectsAndDesigns;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 1050,
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
          ListView.builder(
            itemBuilder: (conetxt, index) => SingleProjectCard(
              imgUrl: projectsData[index].imgUrl,
              desc: projectsData[index].desc,
              dribbbleLink: projectsData[index].dribbbleLink,
              externalLink: projectsData[index].externalLink,
              githubLink: projectsData[index].githubLink,
              name: projectsData[index].name,
              type: projectsData[index].type,
            ),
            itemCount: 3,
            shrinkWrap: true,
          ),
          const SizedBox(height: 25),
          BasicButton(
            text: 'Browse All Projects',
            click: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProjectsDesktopScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
