// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/project.dart';

import '../../widgets/custom_chip.dart';
import '../../widgets/project_icon_btn.dart';

class SingleProjectCard extends StatelessWidget {
  final Project project;
  const SingleProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 6.0),
            width: double.infinity,
            height: _screenWidth * .521,
            decoration: BoxDecoration(
              color: klightDarkColor,
              border: Border.all(
                color: kprimaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                project.cover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    project.name,
                    style: kMiniTitleTextStyleWhite.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Row(
                    children: [
                      ProjectIconBtn(
                          icon: MdiIcons.github,
                          link: project.githubLink,
                          padding: 4),
                      ProjectIconBtn(
                          icon: MdiIcons.link,
                          link: project.externalLink,
                          padding: 4),
                      ProjectIconBtn(
                          icon: MdiIcons.googlePlay,
                          link: project.playstoreLink,
                          padding: 4),
                    ],
                  ),
                ],
              ),       
              Text(
                project.description,
                style: kNormalTextStyleGrey,
              ),
              const SizedBox(height: 5),
              Row(
                  children: project.tech
                      .map((tech) => CustomChip(name: tech))
                      .toList()),
            ],
          ),
        ],
      ),
    );
  }
}
