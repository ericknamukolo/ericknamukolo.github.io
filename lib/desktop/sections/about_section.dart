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
          horizontal: _screenWidth * .1172, vertical: _screenHeight * .0575),
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
                              color: kprimaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: _screenWidth * .035,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'I’m a Software Engineer, passionate about Flutter Development & UI/UX Design (Mobile/Web Design) with an interest in back-end development (Currently learning Node Js).\n\nI create successful mobile apps(IOS & Android) and responsive websites that are fast, easy to use, and built with best practices. The main area of my expertise is front-end development using Flutter, Dart, HTML, CSS, JS, building small,medium and large software applications,features, animations, and coding interactive layouts.\n\nI have worked on a multitude of mobile and web based projects for a number of clients providing Mobile & Web Design (Adobe XD) and Development (Flutter,Dart,Firebase,Sqflite, Responsive Layouts).',
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
