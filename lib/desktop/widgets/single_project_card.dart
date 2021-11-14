import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/desktop/widgets/project_images_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProjectCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final clickedProject = Provider.of<Projects>(context, listen: false)
        .projectsAndDesigns
        .firstWhere((proj) => proj.id == id);
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
                      image: NetworkImage(imgUrl),
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
                        type,
                        style: kMiniTitleTextStylePink,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: kTitleTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        desc,
                        style: kNormalTextStyleGrey,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          dribbbleLink == '0'
                              ? Container()
                              : IconHover(
                                  icon: MdiIcons.basketball,
                                  color: kprimaryColor,
                                  click: () async {
                                    await launch(
                                      dribbbleLink,
                                    );
                                  },
                                ),
                          githubLink == '0'
                              ? Container()
                              : IconHover(
                                  icon: MdiIcons.github,
                                  color: kprimaryColor,
                                  click: () async {
                                    await launch(
                                      githubLink,
                                    );
                                  },
                                ),
                          externalLink == '0'
                              ? Container()
                              : IconHover(
                                  icon: MdiIcons.openInNew,
                                  color: kprimaryColor,
                                  click: () async {
                                    await launch(
                                      externalLink,
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
    }
    return Container();
  }
}
