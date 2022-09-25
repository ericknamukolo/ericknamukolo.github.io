import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/home_icon_hover.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:url_launcher/url_launcher.dart';

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
                BasicButton(
                  text: 'Browse Projects',
                  click: scrollToProjects,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    HomeIconHover(
                      icon: MdiIcons.linkedin,
                      color: const Color(0xff0A66C2),
                      click: () async {
                        await launch(
                          'https://www.linkedin.com/in/ericknamukolo/',
                        );
                      },
                    ),
                    HomeIconHover(
                      icon: MdiIcons.github,
                      color: const Color(0xff171515),
                      click: () async {
                        await launch(
                          'https://github.com/ericknamukolo',
                        );
                      },
                    ),
                    HomeIconHover(
                      icon: Icons.whatsapp_rounded,
                      color: const Color(0xff075e54),
                      click: () async {
                        var whatsappUrl =
                            'https://wa.me/260962885743?text=Hello';
                        await launch(whatsappUrl);
                      },
                    ),
                    HomeIconHover(
                      icon: MdiIcons.facebook,
                      color: const Color(0xff4267B2),
                      click: () async {
                        await launch(
                          'https://www.facebook.com/ericnamukolo/',
                        );
                      },
                    ),
                    HomeIconHover(
                      icon: LineIcons.dribbble,
                      color: const Color(0xffea4c89),
                      click: () async {
                        await launch(
                          'https://dribbble.com/erickmndev',
                        );
                      },
                    ),
                    HomeIconHover(
                      icon: MdiIcons.coffee,
                      color: const Color(0xff29abe0),
                      click: () async {
                        await launch(
                          'https://ko-fi.com/erickmndev',
                        );
                      },
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
