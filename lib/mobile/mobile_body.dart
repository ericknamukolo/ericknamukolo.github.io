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
import 'package:portfolio/mobile/sections/m_work_experience.dart';
import 'package:portfolio/mobile/widgets/app_bar_icon.dart';
import 'package:portfolio/mobile/widgets/hover_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

import '../providers/analytics.dart';
import '../services/notification.dart';

class MobileBody extends StatelessWidget {
  final contactKey = GlobalKey();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final expKey = GlobalKey();
  final projectsKey = GlobalKey();

  MobileBody({Key? key}) : super(key: key);

  Future scrollToItem(var sectionKey) async {
    final context = sectionKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOutBack,
    );
  }

  final ScrollController _scrollController = ScrollController();
  final phone = '+260962885743';
  final text = 'Hello There,';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Analytics.trackVisit(NotificationType.whatsApp);
          var whatsappUrl = 'whatsapp://send?phone=$phone&text=$text';
          await launch(whatsappUrl);
        },
        child: const Icon(
          MdiIcons.whatsapp,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff075e54),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          color: kdarkColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 15),
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/serious.png'),
                  backgroundColor: klightDarkColor,
                  radius: 90,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    MdiIcons.chevronLeft,
                    color: kprimaryColor,
                  ),
                  Text(
                    'Erick Namukolo',
                    style: kTextStyleWhite.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Icon(
                    MdiIcons.chevronRight,
                    color: kprimaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              HoverContainer(
                child: const AnimatedTexttt(
                  text: 'Home',
                ),
                click: () {
                  scrollToItem(homeKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: const AnimatedTexttt(
                  text: 'About',
                ),
                click: () {
                  scrollToItem(aboutKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: const AnimatedTexttt(
                  text: 'Skills',
                ),
                click: () {
                  scrollToItem(skillsKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: const AnimatedTexttt(
                  text: 'Work Experience',
                ),
                click: () {
                  scrollToItem(expKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: const AnimatedTexttt(
                  text: 'Projects',
                ),
                click: () {
                  scrollToItem(projectsKey);
                  Navigator.pop(context);
                },
              ),
              HoverContainer(
                child: const AnimatedTexttt(
                  text: 'Contact',
                ),
                click: () {
                  scrollToItem(contactKey);
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                MHomeSection(key: homeKey),
                MAboutSection(key: aboutKey),
                MSkillSection(key: skillsKey),
                MWorkExperience(key: expKey),
                MProjectsAndDesigns(key: projectsKey),
                MContactSection(key: contactKey),
                const FooterSection(),
              ],
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: BlurryContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return AppBarIcon(
                          icon: MdiIcons.menuOpen,
                          click: () => Scaffold.of(context).openDrawer());
                    }),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          scrollToItem(homeKey);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: CircleAvatar(
                            foregroundImage: AssetImage('assets/avatar.png'),
                            backgroundColor: klightDarkColor,
                          ),
                        ),
                      ),
                    ),
                    AppBarIcon(
                      icon: MdiIcons.googlePlay,
                      click: () async {
                        Analytics.trackVisit(NotificationType.playStore);
                        await launch(
                          'https://play.google.com/store/apps/dev?id=8203990443766365712',
                        );
                      },
                    ),
                  ],
                ),
                blur: 1.5,
                width: double.infinity,
                height: 60,
                elevation: 6,
                color: Colors.white.withOpacity(0.2),
                padding: const EdgeInsets.all(8),
                borderRadius: const BorderRadius.all(Radius.circular(45)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
