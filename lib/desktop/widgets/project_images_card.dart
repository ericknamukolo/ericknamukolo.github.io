// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/project.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectImagesCard extends StatefulWidget {
  const ProjectImagesCard({
    Key? key,
    required this.clickedProject,
  }) : super(key: key);

  final Project clickedProject;

  @override
  State<ProjectImagesCard> createState() => _ProjectImagesCardState();
}

class _ProjectImagesCardState extends State<ProjectImagesCard> {
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: kdarkColor,
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.previousPage();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: kdarkColor,
                        child: const Icon(
                          MdiIcons.chevronLeft,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  ),
                  itemCount: widget.clickedProject.images.length,
                  itemBuilder: (context, index, realIndex) => Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    width: 1000,
                    decoration: BoxDecoration(
                      color: kdarkColor,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.clickedProject.images[index],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.nextPage();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: kdarkColor,
                        child: const Icon(
                          MdiIcons.chevronRight,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 60,
              decoration: BoxDecoration(
                color: kdarkColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.clickedProject.type,
                    style: kMiniTitleTextStylePink,
                  ),
                  Text(
                    widget.clickedProject.name,
                    style: kTitleTextStyle.copyWith(fontSize: 25),
                  ),
                  // Text(
                  //   widget.clickedProject.desc,
                  //   style: kNormalTextStyleGrey,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
