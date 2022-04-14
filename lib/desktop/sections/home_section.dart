import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomeSection extends StatelessWidget {
  final Function() scrollToProjects;
  const HomeSection({
    Key? key,
    required this.scrollToProjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 70),
      height: 620,
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
                    const Text(
                      'I am a ',
                      style: kTitleTextStyle,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flutter',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Front-End',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Software',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Web',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Mobile App',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      pause: const Duration(milliseconds: 300),
                      repeatForever: true,
                    ),
                  ],
                ),
                const Text(
                  'Developer.',
                  style: kTitleTextStyle,
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
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const AvatarGlow(
                endRadius: 120.0 * 1.5,
                animate: true,
                glowColor: kprimaryColor,
                repeat: true,
                duration: Duration(milliseconds: 2000),
                // repeatPauseDuration: Duration(milliseconds: 30),
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/avatar.png'),
                  backgroundColor: klightDarkColor,
                  radius: 90 * 1.5,
                ),
              ),
            ),
            // child: SvgPicture.asset(
            //   'assets/result.svg',
            //   fit: BoxFit.cover,
            // ),
          ),
        ],
      ),
    );
  }
}
