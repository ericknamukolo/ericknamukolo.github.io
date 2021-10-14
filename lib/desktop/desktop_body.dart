// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/sections/about_section.dart';
import 'package:portfolio/desktop/sections/contact_section.dart';
import 'package:portfolio/desktop/sections/footer_section.dart';
import 'package:portfolio/desktop/sections/home_section.dart';
import 'package:portfolio/desktop/sections/projects_and_designs.dart';
import 'package:portfolio/desktop/sections/skills_section.dart';
import 'package:portfolio/desktop/widgets/animated_text.dart';

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
  double homeWidth = 0;
  double aboutWidth = 0;
  double skillsWidth = 0;
  double projectsWidth = 0;
  double contactWidth = 0;

  Future scrollToItem(var sectionKey) async {
    final context = sectionKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOutBack,
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var currentPositon = _scrollController.position.pixels;
      if (currentPositon >= 0 && currentPositon < 620) {
        setState(() {
          homeWidth = 40;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 620 && currentPositon < 1500) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 40;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 1500 && currentPositon < 2400) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 40;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 2400 && currentPositon < 4000) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 40;
          contactWidth = 0;
        });
      } else if (currentPositon >= 4000) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 40;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//easeInOutCubic
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkColor,
      floatingActionButton: Container(
        width: double.infinity,
        height: 70,
        color: kdarkColor,
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: const [
                  Icon(
                    MdiIcons.chevronLeft,
                    color: kprimaryColor,
                  ),
                  Text(
                    'Erick Namukolo',
                    style: kTextStyleWhite,
                  ),
                  Icon(
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
                    click: () {
                      scrollToItem(homeKey);
                    },
                    width: homeWidth,
                  ),
                  AnimatedTexttt(
                    text: 'About',
                    click: () {
                      scrollToItem(aboutKey);
                    },
                    width: aboutWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Skills',
                    click: () {
                      scrollToItem(skillsKey);
                    },
                    width: skillsWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Projects',
                    click: () {
                      scrollToItem(projectsKey);
                    },
                    width: projectsWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Contact',
                    click: () {
                      scrollToItem(contactKey);
                    },
                    width: contactWidth,
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: kprimaryColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(4, 6),
                          color: const Color(0xff000000).withOpacity(.16),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Resume',
                        style: kNormalTextStyleWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HomeSection(key: homeKey),
            AboutSection(key: aboutKey),
            SkillsSection(key: skillsKey),
            ProjectsAndDesigns(key: projectsKey),
            ContactSection(key: contactKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
