import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/desktop/sections/about_section.dart';
import 'package:portfolio/desktop/sections/home_section.dart';
import 'package:portfolio/desktop/sections/skills_section.dart';
import 'package:portfolio/widgets/top_nav_bar.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightDarkColor,
      floatingActionButton: const TopNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            HomeSection(),
            AboutSection(),
            SkillsSection(),
          ],
        ),
      ),
    );
  }
}
