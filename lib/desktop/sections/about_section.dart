import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      color: kdarkColor,
      width: double.infinity,
      height: 1000,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: const [
                Text(
                  'About',
                  style: kMiniTitleTextStyleWhite,
                ),
                Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 500,
                  indent: 500,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: klightDarkColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 5),
                            color: const Color(0xff000000).withOpacity(.12),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.red,
              ))
            ],
          ),
        ],
      ),
    );
  }
}
