import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/desktop/widgets/project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';

import '../../mobile/widgets/tab_btn.dart';
import '../../models/project.dart';
import '../../models/tab_btn.dart';
import '../../widgets/custom_loading_widget.dart';
import '../../widgets/section_title.dart';
import '../projects_desktop_screen.dart';
import '../widgets/mordern_button.dart';

class ProjectsAndDesigns extends StatefulWidget {
  const ProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  State<ProjectsAndDesigns> createState() => _ProjectsAndDesignsState();
}

class _ProjectsAndDesignsState extends State<ProjectsAndDesigns> {
  List<TabButton> tabs = [
    TabButton(title: 'Personal Projects', icon: Icons.folder, isSelected: true),
    TabButton(title: 'Work/Client Projects', icon: Icons.laptop_mac_rounded),
  ];
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
          Container(
            padding: EdgeInsets.all(12),
            width: _screenWidth * .35,
            decoration: BoxDecoration(
              color: klightDarkColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.10),
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 3.0),
                )
              ],
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: tabs
                  .map((tab) => TabBtn(
                        tab: tab,
                        click: () {
                          setState(() {
                            tabs.forEach((element) {
                              element.isSelected = false;
                            });
                            tab.isSelected = true;
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: 30),
          Consumer<Projects>(
            builder: (context, value, __) {
              List<Project> projects = [];
              projects = value.projects
                  .where((element) => tabs.first.isSelected
                      ? element.isPersonal
                      : !element.isPersonal)
                  .toList();
              return value.projects.isEmpty
                  ? CustomLoadingWidget()
                  : ListView.builder(
                      itemBuilder: (context, index) =>
                          ProjectCard(project: projects[index]),
                      itemCount: projects.isEmpty ? 0 : projects.length,
                      shrinkWrap: true,
                    );
            },
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
