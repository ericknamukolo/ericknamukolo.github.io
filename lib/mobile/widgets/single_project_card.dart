// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProjectCard extends StatelessWidget {
  final Project project;
  const SingleProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    print(_screenWidth * .521);
    return Container(
      margin: EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 6.0),
            width: double.infinity,
            height: _screenWidth * .521,
            color: klightDarkColor,
            child: Image.network(
              project.imgUrl,
              fit: BoxFit.cover,
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
                      project.dribbbleLink == '0'
                          ? Container()
                          : IconHover(
                              icon: LineIcons.dribbble,
                              color: kprimaryColor,
                              click: () async {
                                await launch(
                                  project.dribbbleLink,
                                );
                              },
                              padding: 4,
                            ),
                      project.githubLink == '0'
                          ? Container()
                          : IconHover(
                              padding: 4,
                              icon: LineIcons.github,
                              color: kprimaryColor,
                              click: () async {
                                await launch(
                                  project.githubLink,
                                );
                              },
                            ),
                      project.externalLink == '0'
                          ? Container()
                          : IconHover(
                              padding: 4,
                              icon: LineIcons.alternateExternalLink,
                              color: kprimaryColor,
                              click: () async {
                                await launch(
                                  project.externalLink,
                                );
                              },
                            ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                project.desc,
                style: kNormalTextStyleGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 