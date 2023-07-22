import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/tablet/widgets/t_project_card.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/section_title.dart';

class TProjectsAndDesigns extends StatelessWidget {
  const TProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 50.0),
      width: double.infinity,
      color: kdarkColor,
      child: Consumer<Projects>(
        builder: (index, value, __) => Column(
          children: [
            SectionTitle(title: 'Projects & Designs'),
            ListView.builder(
              itemBuilder: (context, index) => TProjectCard(
                project: value.projects[index],
              ),
              itemCount: value.projects.isEmpty ? 0 : value.projects.length,
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
      ),
    );
  }
}
