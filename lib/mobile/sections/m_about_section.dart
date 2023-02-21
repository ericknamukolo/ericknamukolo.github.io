import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/about_card.dart';
import 'package:portfolio/widgets/section_title.dart';

class MAboutSection extends StatelessWidget {
  const MAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                                'API integrations throughout many sectors and layers of a software to keep data in sync and enhance productivity.',
                            iconPath: 'assets/api.png',
                            title: 'API Integration',
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
                                    color: kprimaryColor,
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
                              color: kprimaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        AppData.aboutMe,
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
                      title: 'API Intergration',
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
