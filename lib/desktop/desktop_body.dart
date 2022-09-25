// ignore_for_file: avoid_print

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
import 'package:portfolio/tablet/widgets/cv_button.dart';
import 'package:provider/provider.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../providers/skills.dart';

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

  double _getPosition(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double pos = position.dy;

    return pos - 70.0;
  }

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
      body: Consumer<Skills>(
        builder: (context, data, __) => Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              color: kdarkColor,
              padding: EdgeInsets.symmetric(horizontal: _screenWidth * .059),
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
                              foregroundImage: AssetImage('assets/avatar.png'),
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
                      children: [
                        AnimatedTexttt(
                          text: 'Home',
                          click: () => scrollToItem(homeKey),
                          width: data.pages[0],
                        ),
                        AnimatedTexttt(
                          text: 'About',
                          click: () => scrollToItem(aboutKey),
                          width: data.pages[1],
                        ),
                        AnimatedTexttt(
                          text: 'Skills',
                          click: () => scrollToItem(skillsKey),
                          width: data.pages[2],
                        ),
                        AnimatedTexttt(
                          text: 'Experience',
                          click: () => scrollToItem(experienceKey),
                          width: data.pages[3],
                        ),
                        AnimatedTexttt(
                          text: 'Projects',
                          click: () => scrollToItem(projectsKey),
                          width: data.pages[4],
                        ),
                        AnimatedTexttt(
                          text: 'Contact',
                          click: () => scrollToItem(contactKey),
                          width: data.pages[5],
                        ),
                        const CVButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification info) {
                  if (_getPosition(homeKey) <= 0.0 &&
                      _getPosition(aboutKey) > 0.0) {
                    data.triggerSelection(0);
                  } else if (_getPosition(aboutKey) <= 0.0 &&
                      _getPosition(skillsKey) > 0.0) {
                    data.triggerSelection(1);
                  } else if (_getPosition(skillsKey) <= 0.0 &&
                      _getPosition(experienceKey) > 0.0) {
                    data.triggerSelection(2);
                  } else if (_getPosition(experienceKey) <= 0.0 &&
                      _getPosition(projectsKey) > 0.0) {
                    data.triggerSelection(3);
                  } else if (_getPosition(projectsKey) <= 0.0 &&
                      _getPosition(contactKey) > 0) {
                    data.triggerSelection(4);
                  } else if (_getPosition(contactKey) <= 0.0) {
                    data.triggerSelection(5);
                  }

                  return true;
                },
                child: WebSmoothScroll(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
