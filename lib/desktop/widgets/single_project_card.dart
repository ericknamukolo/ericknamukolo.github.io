import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/constants/responsive_breakpoints.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/desktop/widgets/project_images_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProjectCard extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String imgUrl;
  final String desc;
  final String githubLink;
  final String dribbbleLink;
  final String externalLink;
  const SingleProjectCard({
    Key? key,
    required this.id,
    required this.name,
    required this.type,
    required this.imgUrl,
    required this.desc,
    required this.githubLink,
    required this.externalLink,
    required this.dribbbleLink,
  }) : super(key: key);

  @override
  State<SingleProjectCard> createState() => _SingleProjectCardState();
}

class _SingleProjectCardState extends State<SingleProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    final clickedProject = Provider.of<Projects>(context, listen: false)
        .projectsAndDesigns
        .firstWhere((proj) => proj.id == widget.id);
    if (MediaQuery.of(context).size.width >= 1000) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) =>
                  ProjectImagesCard(clickedProject: clickedProject),
              isScrollControlled: true,
            );
          },
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    color: klightDarkColor,
                    image: DecorationImage(
                      image: NetworkImage(widget.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: klightDarkColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.type,
                        style: kMiniTitleTextStylePink,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.name,
                        style: kTitleTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.desc,
                        style: kNormalTextStyleGrey,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.dribbbleLink == '0'
                              ? Container()
                              : IconHover(
                                  icon: MdiIcons.basketball,
                                  color: kprimaryColor,
                                  click: () async {
                                    await launch(
                                      widget.dribbbleLink,
                                    );
                                  },
                                ),
                          widget.githubLink == '0'
                              ? Container()
                              : IconHover(
                                  icon: MdiIcons.github,
                                  color: kprimaryColor,
                                  click: () async {
                                    await launch(
                                      widget.githubLink,
                                    );
                                  },
                                ),
                          widget.externalLink == '0'
                              ? Container()
                              : IconHover(
                                  icon: MdiIcons.openInNew,
                                  color: kprimaryColor,
                                  click: () async {
                                    await launch(
                                      widget.externalLink,
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
      );
    } else if (MediaQuery.of(context).size.width <= kTabletBreakpoint) {
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
            color: kdarkColor,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                widget.imgUrl,
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
                    widget.type == 'Project'
                        ? Icons.folder_open_rounded
                        : Icons.design_services_outlined,
                    color: kprimaryColor,
                    size: 40,
                  ),
                  Row(
                    children: [
                      widget.dribbbleLink == '0'
                          ? Container()
                          : IconHover(
                              icon: LineIcons.dribbble,
                              color: kprimaryColor,
                              click: () async {
                                await launch(
                                  widget.dribbbleLink,
                                );
                              },
                              padding: 4,
                            ),
                      widget.githubLink == '0'
                          ? Container()
                          : IconHover(
                              padding: 4,
                              icon: LineIcons.github,
                              color: kprimaryColor,
                              click: () async {
                                await launch(
                                  widget.githubLink,
                                );
                              },
                            ),
                      widget.externalLink == '0'
                          ? Container()
                          : IconHover(
                              padding: 4,
                              icon: LineIcons.alternateExternalLink,
                              color: kprimaryColor,
                              click: () async {
                                await launch(
                                  widget.externalLink,
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
                widget.name,
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
                widget.desc,
                style: kNormalTextStyleGrey,
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
