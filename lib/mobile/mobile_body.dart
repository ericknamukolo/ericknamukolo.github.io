import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/sections/footer_section.dart';
import 'package:portfolio/desktop/widgets/animated_text.dart';
import 'package:portfolio/mobile/sections/m_about_section.dart';
import 'package:portfolio/mobile/sections/m_contact_section.dart';
import 'package:portfolio/mobile/sections/m_home_section.dart';
import 'package:portfolio/mobile/sections/m_project_and_designs.dart';
import 'package:portfolio/mobile/sections/m_skill_section.dart';
import 'package:portfolio/mobile/widgets/hover_container.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
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
      if (currentPositon >= 0 && currentPositon < 600) {
        setState(() {
          homeWidth = 30;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 600 && currentPositon < 1400) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 30;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 1400 && currentPositon < 3300) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 30;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 3300 && currentPositon < 4650) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 30;
          contactWidth = 0;
        });
      } else if (currentPositon >= 4650) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 30;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkColor,
      drawer: Drawer(
        child: Container(
          color: kdarkColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              HoverContainer(
                child: AnimatedTexttt(
                  text: 'Home',
                  width: homeWidth,
                ),
                click: () {
                  scrollToItem(homeKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: AnimatedTexttt(
                  text: 'About',
                  width: aboutWidth,
                ),
                click: () {
                  scrollToItem(aboutKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: AnimatedTexttt(
                  text: 'Skills',
                  width: skillsWidth,
                ),
                click: () {
                  scrollToItem(skillsKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: AnimatedTexttt(
                  text: 'Projects',
                  width: projectsWidth,
                ),
                click: () {
                  scrollToItem(projectsKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: AnimatedTexttt(
                  text: 'Contact',
                  width: contactWidth,
                ),
                click: () {
                  scrollToItem(contactKey);
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
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
              const SizedBox(
                height: 10,
              ),
              Center(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: klightDarkColor,
                      radius: 30,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kdarkColor,
        actions: [
          Row(
            children: [
              const Icon(
                MdiIcons.chevronLeft,
                color: kprimaryColor,
              ),
              Text(
                'Erick Namukolo',
                style: kTextStyleWhite.copyWith(fontSize: 15),
              ),
              const Icon(
                MdiIcons.chevronRight,
                color: kprimaryColor,
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            MHomeSection(key: homeKey),
            MAboutSection(key: aboutKey),
            MSkillSection(key: skillsKey),
            MProjectsAndDesigns(key: projectsKey),
            MContactSection(key: contactKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
