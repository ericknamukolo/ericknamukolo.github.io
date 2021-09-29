import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/basic_button.dart';

class THomeSection extends StatelessWidget {
  const THomeSection({Key? key}) : super(key: key);

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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: kNormalTextStyleGrey,
                ),
                const SizedBox(
                  height: 30,
                ),
                const BasicButton(
                  text: 'Browse Projects',
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
              : Text(''),
        ],
      ),
    );
  }
}
