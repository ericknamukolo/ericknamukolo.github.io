// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProjectCard extends StatefulWidget {
  final Project project;
  const SingleProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<SingleProjectCard> createState() => _SingleProjectCardState();
}

class _SingleProjectCardState extends State<SingleProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: _isHovered ? 260 : 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: klightDarkColor,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              widget.project.imgUrl,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              kdarkColor.withOpacity(_isHovered ? 0.6 : 0.95),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  widget.project.type == 'Project'
                      ? Icons.folder_open_rounded
                      : Icons.design_services_outlined,
                  color: kprimaryColor,
                  size: 40,
                ),
                Row(
                  children: [
                    widget.project.dribbbleLink == '0'
                        ? Container()
                        : IconHover(
                            icon: LineIcons.dribbble,
                            color: kprimaryColor,
                            click: () async {
                              await launch(
                                widget.project.dribbbleLink,
                              );
                            },
                            padding: 4,
                          ),
                    widget.project.githubLink == '0'
                        ? Container()
                        : IconHover(
                            padding: 4,
                            icon: LineIcons.github,
                            color: kprimaryColor,
                            click: () async {
                              await launch(
                                widget.project.githubLink,
                              );
                            },
                          ),
                    widget.project.externalLink == '0'
                        ? Container()
                        : IconHover(
                            padding: 4,
                            icon: LineIcons.alternateExternalLink,
                            color: kprimaryColor,
                            click: () async {
                              await launch(
                                widget.project.externalLink,
                              );
                            },
                          ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.project.name,
              style: kMiniTitleTextStyleWhite.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.project.desc,
              style: kNormalTextStyleGrey,
            ),
          ],
        ),
      ),
    );
  }
}

// 