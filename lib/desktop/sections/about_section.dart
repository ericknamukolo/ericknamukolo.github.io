import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/about_card.dart';

import '../../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _screenWidth * .1172, vertical: _screenHeight * .065),
      color: klightDarkColor,
      width: double.infinity,
      child: Column(
        children: [
          SectionTitle(title: 'About'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: const [
                    AboutCard(
                      content:
                          'I value simple , clean design patterns, and thoughtful interactions.',
                      iconPath: 'assets/vector.png',
                      title: 'UI/UX Design',
                    ),
                    AboutCard(
                      content:
                          'Using Flutter & Dart, I build fast, interactive apps & websites.',
                      iconPath: 'assets/programming-code-signs.png',
                      title: 'Front-End Development',
                    ),
                    AboutCard(
                      content:
                          'API integrations throughout a software to keep data in sync and enhance productivity.',
                      iconPath: 'assets/api.png',
                      title: 'API Integration',
                    ),
                    AboutCard(
                      content:
                          'I enjoy bringing ideas to life on the phone or in the browser.',
                      iconPath: 'assets/web-development.png',
                      title: 'Mobile/Web Development',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: kTitleTextStyle.copyWith(
                          fontSize: _screenWidth * .035,
                        ),
                        children: [
                          const TextSpan(text: 'Hi there! I\'m '),
                          TextSpan(
                            text: 'Erick Namukolo',
                            style: kTitleTextStyle.copyWith(
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: _screenWidth * .035,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        AppData.aboutMe,
                        style: kNormalTextStyleGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
