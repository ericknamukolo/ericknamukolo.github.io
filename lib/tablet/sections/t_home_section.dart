import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/basic_button.dart';

class THomeSection extends StatelessWidget {
  final Function() scrollToProjects;
  const THomeSection({
    Key? key,
    required this.scrollToProjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 70),
      height: 600,
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
                      style: kTitleTextStyle.copyWith(fontSize: 40),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flutter',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'Web',
                          textStyle: kTitleTextStyle.copyWith(
                            color: kprimaryColor,
                            fontWeight: FontWeight.bold,
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
          MediaQuery.of(context).size.width >= 860
              ? Expanded(
                  child: Lottie.asset(
                    'assets/home.json',
                    fit: BoxFit.fill,
                    repeat: true,
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}