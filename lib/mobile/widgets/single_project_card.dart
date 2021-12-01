// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProjectCard extends StatelessWidget {
  final String imgUrl;
  final String desc;
  final String type;
  final String name;
  final String dribbbleLink;
  final String githubLink;
  final String externalLink;
  const SingleProjectCard({
    Key? key,
    required this.imgUrl,
    required this.desc,
    required this.type,
    required this.name,
    required this.dribbbleLink,
    required this.githubLink,
    required this.externalLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            height: 230,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                topLeft: Radius.circular(6),
              ),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 14),
            height: 230,
            decoration: const BoxDecoration(
              color: kdarkColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: kMiniTitleTextStylePink.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  name,
                  style: kTitleTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Flexible(
                  child: Container(
                    child: Text(
                      desc,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 10,
                      style: kNormalTextStyleGrey.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
