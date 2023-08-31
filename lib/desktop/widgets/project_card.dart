// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/project_images_card.dart';

import '../../models/project.dart';
import '../../widgets/custom_chip.dart';
import '../../widgets/project_icon_btn.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) =>
                    ProjectImagesCard(clickedProject: widget.project),
                isScrollControlled: true,
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              height: _screenHeight * 0.578,
              width: double.infinity,
              child: Stack(
                //alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeInBack,
                      height: _screenHeight * .578,
                      width: _isHovered
                          ? _screenWidth * .549
                          : _screenWidth * .512,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: NetworkImage(widget.project.cover),
                          fit: BoxFit.contain,
                          colorFilter: _isHovered
                              ? null
                              : ColorFilter.mode(
                                  kprimaryColor.withOpacity(0.2),
                                  BlendMode.srcOver,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.bounceOut,
                      height: _screenHeight * .506,
                      width: _isHovered
                          ? _screenWidth * .241
                          : _screenWidth * .307,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.project.name,
                            textAlign: TextAlign.left,
                            style: kTitleTextStyle.copyWith(
                                fontSize: _screenWidth * .0204),
                          ),
                          const SizedBox(height: 5),
                          Row(
                              children: widget.project.tech
                                  .map((tech) => CustomChip(name: tech))
                                  .toList()),
                          Container(
                            height: _screenHeight * .231,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: klightDarkColor,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(3, 5),
                                  color:
                                      const Color(0xff000000).withOpacity(.1),
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Text(
                              widget.project.description,
                              style: kNormalTextStyleGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ProjectIconBtn(
                                  icon: MdiIcons.github,
                                  link: widget.project.githubLink),
                              ProjectIconBtn(
                                  icon: MdiIcons.link,
                                  link: widget.project.externalLink),
                              ProjectIconBtn(
                                  icon: MdiIcons.googlePlay,
                                  link: widget.project.playstoreLink),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // const Divider(
        //   color: kprimaryColor,
        //   thickness: 3,
        //   endIndent: 450,
        //   indent: 450,
        // ),
      ],
    );
  }
}
