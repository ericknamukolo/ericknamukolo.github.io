import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/desktop/widgets/project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/section_title.dart';
import '../projects_desktop_screen.dart';

class ProjectsAndDesigns extends StatelessWidget {
  const ProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _screenWidth * .1172, vertical: _screenHeight * .065),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Projects & Designs'),
          Consumer<Projects>(
            builder: (context, projectsData, __) => ListView.builder(
              itemBuilder: (context, index) =>
                  ProjectCard(project: projectsData.projectsAndDesigns[index]),
              itemCount: projectsData.projectsAndDesigns.isEmpty ? 0 : 3,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BasicButton(
            text: 'All Projects',
            click: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProjectsDesktopScreen()));
            },
          ),
        ],
      ),
    );
  }
}
