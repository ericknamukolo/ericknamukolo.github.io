import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/tablet/widgets/t_project_card.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/section_title.dart';

class TProjectsAndDesigns extends StatelessWidget {
  const TProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectsData =
        Provider.of<Projects>(context, listen: false).projectsAndDesigns;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 50.0),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Projects & Designs'),
          ListView.builder(
            itemBuilder: (context, index) => TProjectCard(
              desc: projectsData[index].desc,
              id: projectsData[index].id,
              name: projectsData[index].name,
              type: projectsData[index].type,
              imgUrl: projectsData[index].imgUrl,
            ),
            itemCount: 3,
            shrinkWrap: true,
          ),
          const SizedBox(
            height: 20,
          ),
          BasicButton(
            text: 'Browse All Projects',
            click: () {},
          ),
        ],
      ),
    );
  }
}
