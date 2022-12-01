// ignore_for_file: avoid_print

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/sections/about_section.dart';
import 'package:portfolio/desktop/sections/contact_section.dart';
import 'package:portfolio/desktop/sections/experience_section.dart';
import 'package:portfolio/desktop/sections/footer_section.dart';
import 'package:portfolio/desktop/sections/home_section.dart';
import 'package:portfolio/desktop/sections/projects_and_designs.dart';
import 'package:portfolio/desktop/sections/skills_section.dart';
import 'package:portfolio/desktop/widgets/animated_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../mobile/widgets/app_bar_icon.dart';
import '../providers/projects.dart';
import '../widgets/basic_button.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  final contactKey = GlobalKey();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  double homeWidth = 0;
  double aboutWidth = 0;
  double skillsWidth = 0;
  double experienceWidth = 0;
  double projectsWidth = 0;
  double contactWidth = 0;

  Future scrollToItem(GlobalKey sectionKey) async {
    final context = sectionKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOutBack,
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//easeInOutCubic
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kdarkColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          WebSmoothScroll(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  HomeSection(
                    key: homeKey,
                    scrollToProjects: () {
                      scrollToItem(projectsKey);
                    },
                  ),
                  AboutSection(key: aboutKey),
                  SkillsSection(key: skillsKey),
                  ExperienceSection(key: experienceKey),
                  ProjectsAndDesigns(key: projectsKey),
                  ContactSection(key: contactKey),
                  const FooterSection(),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: _screenWidth * .059),
              child: BlurryContainer(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: _screenWidth > 1700 ? 2 : 1,
                      child: Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                scrollToItem(homeKey);
                              },
                              child: const CircleAvatar(
                                foregroundImage:
                                    AssetImage('assets/avatar.png'),
                                backgroundColor: klightDarkColor,
                                radius: 23,
                              ),
                            ),
                          ),
                          const Icon(
                            MdiIcons.chevronLeft,
                            color: kprimaryColor,
                          ),
                          const Text(
                            'Erick Namukolo',
                            style: kTextStyleWhite,
                          ),
                          const Icon(
                            MdiIcons.chevronRight,
                            color: kprimaryColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedTexttt(
                            text: 'Home',
                            click: () => scrollToItem(homeKey),
                            width: homeWidth,
                          ),
                          AnimatedTexttt(
                            text: 'About',
                            click: () => scrollToItem(aboutKey),
                            width: aboutWidth,
                          ),
                          AnimatedTexttt(
                            text: 'Skills',
                            click: () => scrollToItem(skillsKey),
                            width: skillsWidth,
                          ),
                          AnimatedTexttt(
                            text: 'Experience',
                            click: () => scrollToItem(experienceKey),
                            width: experienceWidth,
                          ),
                          AnimatedTexttt(
                            text: 'Projects',
                            click: () => scrollToItem(projectsKey),
                            width: projectsWidth,
                          ),
                          AnimatedTexttt(
                            text: 'Contact',
                            click: () => scrollToItem(contactKey),
                            width: contactWidth,
                          ),
                          // BasicButton(
                          //   text: 'CV',
                          //   wid: 120,
                          //   click: () {
                          //     Provider.of<Projects>(context, listen: false)
                          //         .downloadCV();
                          //   },
                          // ),
                          AppBarIcon(
                              icon: Icons.download_rounded, click: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
                blur: 1.5,
                width: double.infinity,
                height: 70,
                elevation: 6,
                color: Colors.white.withOpacity(0.2),
                padding: const EdgeInsets.all(16),
                borderRadius: const BorderRadius.all(Radius.circular(45)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Container(
//             width: double.infinity,
//             height: 70,
//             color: kdarkColor,
//             padding: EdgeInsets.symmetric(horizontal: _screenWidth * .059),
//             child: ,
//           ),