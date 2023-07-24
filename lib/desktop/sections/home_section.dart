import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/home_icon_hover.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../widgets/mordern_button.dart';

class HomeSection extends StatelessWidget {
  final Function() scrollToProjects;
  const HomeSection({
    Key? key,
    required this.scrollToProjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 70),
      padding: EdgeInsets.symmetric(
          horizontal: _screenWidth * .1172, vertical: _screenHeight * .1),
      height: _screenHeight * .8,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'I am a ',
                      style: kTitleTextStyle.copyWith(
                        fontSize: _screenWidth * .035,
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flutter',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: _screenWidth * .035,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Front-End',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: _screenWidth * .035,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Software',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: _screenWidth * .035,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Web',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: _screenWidth * .035,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Mobile App',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: _screenWidth * .035,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      pause: const Duration(milliseconds: 300),
                      repeatForever: true,
                    ),
                  ],
                ),
                Text(
                  'Developer.',
                  style: kTitleTextStyle.copyWith(
                    fontSize: _screenWidth * .035,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'I\'m a Software Engineer & UI/UX Designer based in Lusaka, Zambia. I build interactive software applications & websites that run across platforms & devices.',
                  style: kNormalTextStyleGrey,
                ),
                const SizedBox(
                  height: 30,
                ),
                MordernButton(
                  icon: MdiIcons.folder,
                  click: scrollToProjects,
                  text: 'Browse Projects',
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    HomeIconHover(
                      icon: MdiIcons.linkedin,
                      color: const Color(0xff0A66C2),
                    ),
                    HomeIconHover(
                      icon: MdiIcons.github,
                      color: const Color(0xff171515),
                    ),
                    HomeIconHover(
                      icon: MdiIcons.whatsapp,
                      color: const Color(0xff075e54),
                    ),
                    HomeIconHover(
                      icon: MdiIcons.facebook,
                      color: const Color(0xff4267B2),
                    ),
                    HomeIconHover(
                      icon: MdiIcons.googlePlay,
                      color: const Color(0xff48ff48),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: AvatarGlow(
                endRadius: _screenWidth < 1700 ? _screenWidth * .15 : 340,
                animate: true,
                glowColor: kprimaryColor,
                repeat: true,
                duration: Duration(seconds: 3),
                // repeatPauseDuration: Duration(milliseconds: 30),
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/avatar.png'),
                  backgroundColor: klightDarkColor,
                  radius: _screenWidth * .099,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
