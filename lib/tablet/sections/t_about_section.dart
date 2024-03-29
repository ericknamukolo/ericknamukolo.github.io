import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/about_card.dart';
import 'package:portfolio/widgets/section_title.dart';

class TAboutSection extends StatelessWidget {
  const TAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50.0),
      color: klightDarkColor,
      width: double.infinity,
      child: Column(
        children: [
          SectionTitle(title: 'About'),
          MediaQuery.of(context).size.width >= 990
              ? Row(
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
                                'I enjoy bringing ideas to life on the phone or in the browser.',
                            iconPath: 'assets/programming-code-signs.png',
                            title: 'Front-End Development',
                          ),
                          AboutCard(
                            content:
                                'API integrations throughout a software to keep data in sync and enhance productivity.',
                            iconPath: 'assets/api.png',
                            title: 'API Intergration',
                          ),
                          AboutCard(
                            content:
                                'I value simple , clean design patterns, and thoughtful interactions.',
                            iconPath: 'assets/web-development.png',
                            title: 'Mobile/Web Development',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Introduction',
                            style: kNormalTextStyleGrey,
                          ),
                          RichText(
                            text: TextSpan(
                              style: kTitleTextStyle.copyWith(fontSize: 40),
                              children: [
                                const TextSpan(text: 'Hi there! I\'m '),
                                TextSpan(
                                  text: 'Erick Namukolo',
                                  style: kTitleTextStyle.copyWith(
                                    color: kPrimaryColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              AppData.aboutMe,
                              style: kNormalTextStyleGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: kTitleTextStyle.copyWith(fontSize: 40),
                        children: [
                          const TextSpan(text: 'Hi there! I\'m '),
                          TextSpan(
                            text: 'Erick Namukolo',
                            style: kTitleTextStyle.copyWith(
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'I’m a Software Engineer, passionate about Flutter Development & UI/UX Design (Mobile/Web Design) with an interest in back-end development (Currently learning Node Js).\n\nI create successful mobile apps(IOS & Android) and responsive websites that are fast, easy to use, and built with best practices. The main area of my expertise is front-end development using Flutter, Dart, HTML, CSS, JS, building small,medium and large software applications,features, animations, and coding interactive layouts.\n\nI have worked on a multitude of mobile and web based projects for a number of clients providing Mobile & Web Design (Adobe XD) and Development (Flutter,Dart,Firebase,Sqflite, Responsive Layouts).',
                        style: kNormalTextStyleGrey,
                      ),
                    ),
                    const AboutCard(
                      content:
                          'I value simple , clean design patterns, and thoughtful interactions.',
                      iconPath: 'assets/vector.png',
                      title: 'UI/UX Design',
                    ),
                    const AboutCard(
                      content:
                          'I enjoy bringing ideas to life on the phone or in the browser.',
                      iconPath: 'assets/programming-code-signs.png',
                      title: 'Front-End Development',
                    ),
                    const AboutCard(
                      content:
                          'API integrations throughout a software to keep data in sync and enhance productivity.',
                      iconPath: 'assets/api.png',
                      title: 'API Integration',
                    ),
                    const AboutCard(
                      content:
                          'I value simple , clean design patterns, and thoughtful interactions.',
                      iconPath: 'assets/web-development.png',
                      title: 'Mobile/Web Development',
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
