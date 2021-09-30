import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/tablet/widgets/t_project_card.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

class TProjectsAndDesigns extends StatelessWidget {
  const TProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectsData =
        Provider.of<Projects>(context, listen: false).projectsAndDesigns;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      width: double.infinity,
      height: 1350,
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
            itemBuilder: (context, index) => TProjectCard(
              desc: projectsData[index].desc,
              id: projectsData[index].id,
              name: projectsData[index].name,
              type: projectsData[index].type,
              imgUrl: projectsData[index].imgUrl,
            ),
            itemCount: projectsData.length,
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
