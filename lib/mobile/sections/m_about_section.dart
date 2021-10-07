import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/about_card.dart';

class MAboutSection extends StatelessWidget {
  const MAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: klightDarkColor,
      width: double.infinity,
      height: 1250,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: const [
                Text(
                  'About',
                  style: kMiniTitleTextStyleWhite,
                ),
                Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 250,
                  indent: 250,
                ),
              ],
            ),
          ),
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
                                'I enjoy bringing ideas to life on the phone or in the browser.',
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
                                    color: kprimaryColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                    const Text(
                      'Introduction',
                      style: kNormalTextStyleGrey,
                    ),
                    const SizedBox(
                      height: 30,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                          'I enjoy bringing ideas to life on the phone or in the browser.',
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
