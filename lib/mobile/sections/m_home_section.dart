// ignore_for_file: sized_box_for_whitespace

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/app_bar_button.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../desktop/widgets/home_icon_hover.dart';

class MHomeSection extends StatelessWidget {
  const MHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const AvatarGlow(
              endRadius: 160.0,
              animate: true,
              glowColor: kprimaryColor,
              repeat: true,
              duration: Duration(milliseconds: 2000),
              // repeatPauseDuration: Duration(milliseconds: 30),
              child: CircleAvatar(
                foregroundImage: AssetImage('assets/avatar.png'),
                backgroundColor: klightDarkColor,
                radius: 90,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I am a ',
                style: kTitleTextStyle.copyWith(fontSize: 40),
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter',
                    textStyle: kTitleTextStyle.copyWith(
                      color: kprimaryColor,
                      fontWeight: MediaQuery.of(context).size.width >= 500
                          ? FontWeight.bold
                          : null,
                      fontSize: 40.0,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'Web',
                    textStyle: kTitleTextStyle.copyWith(
                      color: kprimaryColor,
                      fontWeight: MediaQuery.of(context).size.width >= 500
                          ? FontWeight.bold
                          : null,
                      fontSize: 40.0,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'Software',
                    textStyle: kTitleTextStyle.copyWith(
                      color: kprimaryColor,
                      fontWeight: MediaQuery.of(context).size.width >= 500
                          ? FontWeight.bold
                          : null,
                      fontSize: 40.0,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'Mobile',
                    textStyle: kTitleTextStyle.copyWith(
                      color: kprimaryColor,
                      fontWeight: MediaQuery.of(context).size.width >= 500
                          ? FontWeight.bold
                          : null,
                      fontSize: 40.0,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Developer.',
            style: kTitleTextStyle.copyWith(fontSize: 40),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'I\'m a Software Engineer & UI/UX Designer based in Lusaka, Zambia. I build interactive software applications & websites that run across platforms & devices.',
            textAlign: TextAlign.center,
            style: kNormalTextStyleGrey,
          ),
          const SizedBox(
            height: 30,
          ),
          AppBarButton(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeIconHover(
                icon: MdiIcons.linkedin,
                color: const Color(0xff0A66C2),
                click: () async {
                  await launch(
                    'https://www.linkedin.com/in/ericknamukolo/',
                  );
                },
                isMobile: true,
              ),
              HomeIconHover(
                isMobile: true,
                icon: MdiIcons.github,
                color: const Color(0xff171515),
                click: () async {
                  await launch(
                    'https://github.com/ericknamukolo',
                  );
                },
              ),
              HomeIconHover(
                isMobile: true,
                icon: Icons.whatsapp_rounded,
                color: const Color(0xff075e54),
                click: () async {
                  var whatsappUrl = 'https://wa.me/260962885743?text=Hello';
                  await launch(whatsappUrl);
                },
              ),
              HomeIconHover(
                isMobile: true,
                icon: MdiIcons.facebook,
                color: const Color(0xff4267B2),
                click: () async {
                  await launch(
                    'https://www.facebook.com/ericnamukolo/',
                  );
                },
              ),
              HomeIconHover(
                isMobile: true,
                icon: MdiIcons.googlePlay,
                color: const Color(0xff48ff48),
                click: () async {
                  await launch(
                    'https://play.google.com/store/apps/dev?id=8203990443766365712',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
