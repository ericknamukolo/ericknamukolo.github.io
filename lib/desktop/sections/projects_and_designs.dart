import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

class ProjectsAndDesigns extends StatelessWidget {
  const ProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectsData = Provider.of<Projects>(context).projectsAndDesigns;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      height: 1700,
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
            itemBuilder: (context, index) => ProjectCard(
              id: projectsData[index].id,
              name: projectsData[index].name,
              type: projectsData[index].type,
              desc: projectsData[index].desc,
              imgUrl: projectsData[index].imgUrl,
            ),
            itemCount: 3,
            shrinkWrap: true,
          ),
          const SizedBox(
            height: 20,
          ),
          BasicButton(
            text: 'All Projects',
            click: () {},
          ),
        ],
      ),
    );
  }
}
