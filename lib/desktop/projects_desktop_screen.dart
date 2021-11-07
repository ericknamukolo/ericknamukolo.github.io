import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/single_project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';

class ProjectsDesktopScreen extends StatelessWidget {
  const ProjectsDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectsData = Provider.of<Projects>(context).projectsAndDesigns;
    return Scaffold(
      backgroundColor: kdarkColor,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Opacity(
              opacity: 0.0,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: klightDarkColor,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: klightDarkColor,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                'Projects & Designs',
                style: kMiniTitleTextStyleWhite,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: ListView.builder(
                itemBuilder: (context, index) => SingleProjectCard(
                  id: projectsData[index].id,
                  name: projectsData[index].name,
                  type: projectsData[index].type,
                  desc: projectsData[index].desc,
                  imgUrl: projectsData[index].imgUrl,
                  dribbbleLink: projectsData[index].dribbbleLink,
                  externalLink: projectsData[index].externalLink,
                  githubLink: projectsData[index].githubLink,
                ),
                itemCount: projectsData.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
