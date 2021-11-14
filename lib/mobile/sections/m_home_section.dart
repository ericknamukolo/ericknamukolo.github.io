// ignore_for_file: sized_box_for_whitespace

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:provider/provider.dart';

class MHomeSection extends StatelessWidget {
  const MHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dio = Dio();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 650,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            child: MediaQuery.of(context).size.width >= 500
                ? Lottie.asset(
                    'assets/male.json',
                    fit: BoxFit.fill,
                    repeat: true,
                  )
                : Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/svgg.png',
                    ),
                  ),
            height: 300,
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
                  TypewriterAnimatedText(
                    'Software',
                    textStyle: kTitleTextStyle.copyWith(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'Mobile',
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
            textAlign: TextAlign.center,
            style: kNormalTextStyleGrey,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: BasicButton(
              text: 'Download CV',
              click: () {
                Provider.of<Projects>(context, listen: false).downloadCV();
              },
            ),
          ),
        ],
      ),
    );
  }
}
