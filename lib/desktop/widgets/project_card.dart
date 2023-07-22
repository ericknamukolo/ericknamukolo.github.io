// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/desktop/widgets/project_images_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/project.dart';

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
              height: 400,
              width: double.infinity,
              child: Stack(
                //alignment: Alignment.centerLeft,
                children: [
                  // Positioned(
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 450),
                  //     curve: Curves.easeInBack,
                  //     height: 400,
                  //     width: _isHovered ? 750 : 700,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       image: DecorationImage(
                  //         image: NetworkImage(widget.project.imgUrl),
                  //         fit: BoxFit.contain,
                  //         colorFilter: _isHovered
                  //             ? null
                  //             : ColorFilter.mode(
                  //                 kprimaryColor.withOpacity(0.2),
                  //                 BlendMode.srcOver,
                  //               ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   right: 50,
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 1200),
                  //     curve: Curves.bounceOut,
                  //     height: 350,
                  //     width: _isHovered ? 330 : 420,
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.end,
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Text(widget.project.type,
                  //             style: kMiniTitleTextStylePink),
                  //         Text(
                  //           widget.project.name,
                  //           textAlign: TextAlign.left,
                  //           style: kTitleTextStyle.copyWith(fontSize: 30),
                  //         ),
                  //         Container(
                  //           height: 160,
                  //           width: double.infinity,
                  //           padding: const EdgeInsets.all(20.0),
                  //           decoration: BoxDecoration(
                  //             color: klightDarkColor,
                  //             borderRadius: BorderRadius.circular(6.0),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 offset: const Offset(3, 5),
                  //                 color:
                  //                     const Color(0xff000000).withOpacity(.1),
                  //                 blurRadius: 2.0,
                  //                 spreadRadius: 2.0,
                  //               ),
                  //             ],
                  //           ),
                  //           child: Text(
                  //             widget.project.desc,
                  //             style: kNormalTextStyleGrey,
                  //           ),
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           children: [
                  //             widget.project.dribbbleLink == '0'
                  //                 ? Container()
                  //                 : IconHover(
                  //                     icon: MdiIcons.basketball,
                  //                     color: kprimaryColor,
                  //                     click: () async {
                  //                       await launch(
                  //                         widget.project.dribbbleLink,
                  //                       );
                  //                     },
                  //                   ),
                  //             widget.project.githubLink == '0'
                  //                 ? Container()
                  //                 : IconHover(
                  //                     icon: MdiIcons.github,
                  //                     color: kprimaryColor,
                  //                     click: () async {
                  //                       await launch(
                  //                         widget.project.githubLink,
                  //                       );
                  //                     },
                  //                   ),
                  //             widget.project.externalLink == '0'
                  //                 ? Container()
                  //                 : IconHover(
                  //                     icon: MdiIcons.openInNew,
                  //                     color: kprimaryColor,
                  //                     click: () async {
                  //                       await launch(
                  //                         widget.project.externalLink,
                  //                       );
                  //                     },
                  //                   ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
