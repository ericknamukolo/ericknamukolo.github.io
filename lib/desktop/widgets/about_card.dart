// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class AboutCard extends StatefulWidget {
  final String title;
  final String content;
  final String iconPath;

  const AboutCard({
    Key? key,
    required this.content,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kdarkColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 5),
            color: const Color(0xff000000).withOpacity(.12),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: kMiniTitleTextStylePink,
              ),
              Image.asset(
                widget.iconPath,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
                color: kprimaryColor,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              child: Text(
                widget.content,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 10,
                style: kNormalTextStyleGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
