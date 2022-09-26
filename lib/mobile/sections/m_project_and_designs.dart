import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/projects_desktop_screen.dart';
import 'package:portfolio/mobile/widgets/single_project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';

class MProjectsAndDesigns extends StatelessWidget {
  const MProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Projects & Designs'),
          Consumer<Projects>(
            builder: (context, projectsData, __) => ListView.builder(
              itemBuilder: (conetxt, index) => SingleProjectCard(
                project: projectsData.projectsAndDesigns[index],
              ),
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
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
