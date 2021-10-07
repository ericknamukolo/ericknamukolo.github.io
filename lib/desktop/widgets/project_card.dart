// ignore_for_file: avoid_unnecessary_containers

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/desktop/widgets/project_images_card.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String imgUrl;
  final String desc;

  const ProjectCard({
    Key? key,
    required this.id,
    required this.name,
    required this.type,
    required this.imgUrl,
    required this.desc,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    final clickedProject = Provider.of<Projects>(context, listen: false)
        .projectsAndDesigns
        .firstWhere((proj) => proj.id == widget.id);
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
                    ProjectImagesCard(clickedProject: clickedProject),
                isScrollControlled: true,
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              height: 400,
              width: double.infinity,
              child: Stack(
                //alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeInBack,
                      height: 400,
                      width: _isHovered ? 750 : 700,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: AssetImage(widget.imgUrl),
                          fit: BoxFit.cover,
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
                      height: 350,
                      width: _isHovered ? 330 : 420,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(widget.type, style: kMiniTitleTextStylePink),
                          Text(
                            widget.name,
                            style: kTitleTextStyle.copyWith(fontSize: 30),
                          ),
                          Container(
                            height: 160,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: kdarkColor,
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
                              widget.desc,
                              style: kNormalTextStyleGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconHover(
                                icon: MdiIcons.github,
                                color: kprimaryColor,
                                click: () async {
                                  await launch(
                                    'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                                  );
                                },
                              ),
                              IconHover(
                                icon: MdiIcons.openInNew,
                                color: kprimaryColor,
                                click: () async {
                                  await launch(
                                    'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                                  );
                                },
                              ),
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
        const Divider(
          color: kprimaryColor,
          thickness: 3,
          endIndent: 450,
          indent: 450,
        ),
      ],
    );
  }
}
