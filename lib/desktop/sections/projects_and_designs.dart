import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/desktop/widgets/project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_loading_widget.dart';
import '../../widgets/section_title.dart';
import '../projects_desktop_screen.dart';
import '../widgets/mordern_button.dart';

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
          SectionTitle(title: 'Projects'),
          Consumer<Projects>(
            builder: (context, value, __) => value.projects.isEmpty
                ? CustomLoadingWidget()
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        ProjectCard(project: value.projects[index]),
                    itemCount:
                        value.projects.isEmpty ? 0 : value.projects.length,
                    shrinkWrap: true,
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          MordernButton(
            icon: MdiIcons.folder,
            click: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProjectsDesktopScreen()));
            },
            text: 'All Projects',
          ),
        ],
      ),
    );
  }
}
