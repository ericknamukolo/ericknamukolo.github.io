import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/sections/footer_section.dart';
import 'package:portfolio/desktop/widgets/animated_text.dart';
import 'package:portfolio/tablet/sections/t_about_section.dart';
import 'package:portfolio/tablet/sections/t_contact_section.dart';
import 'package:portfolio/tablet/sections/t_home_section.dart';
import 'package:portfolio/tablet/sections/t_projects_and_designs.dart';
import 'package:portfolio/tablet/sections/t_skill_section.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkColor,
      floatingActionButton: Container(
        width: double.infinity,
        height: 70,
        color: kdarkColor,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
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
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedTexttt(
                    text: 'Home',
                    click: () {},
                  ),
                  AnimatedTexttt(
                    text: 'About',
                    click: () {},
                  ),
                  AnimatedTexttt(
                    text: 'Skills',
                    click: () {},
                  ),
                  AnimatedTexttt(
                    text: 'Projects',
                    click: () {},
                  ),
                  AnimatedTexttt(
                    text: 'Contact',
                    click: () {},
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
        child: Column(
          children: const [
            THomeSection(),
            TAboutSection(),
            TSkillSection(),
            TProjectsAndDesigns(),
            TContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
