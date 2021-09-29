import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key? key,
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
                        image: const AssetImage('assets/dash.png'),
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
                        const Text('Project', style: kMiniTitleTextStylePink),
                        Text(
                          'Portfolio Site',
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
                                color: const Color(0xff000000).withOpacity(.1),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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
