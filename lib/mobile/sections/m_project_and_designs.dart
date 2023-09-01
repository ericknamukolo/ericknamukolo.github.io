import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/mobile/widgets/single_project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';

import '../../models/tab_btn.dart';
import '../../widgets/custom_loading_widget.dart';
import '../widgets/tab_btn.dart';

class MProjectsAndDesigns extends StatefulWidget {
  const MProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  State<MProjectsAndDesigns> createState() => _MProjectsAndDesignsState();
}

class _MProjectsAndDesignsState extends State<MProjectsAndDesigns> {
  List<TabButton> tabs = [
    TabButton(title: 'Personal Projects', icon: Icons.folder, isSelected: true),
    TabButton(title: 'Work/Client Projects', icon: Icons.laptop_mac_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Projects'),
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: klightDarkColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.10),
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 3.0),
                )
              ],
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: tabs
                  .map((tab) => TabBtn(
                        tab: tab,
                        click: () {
                          setState(() {
                            tabs.forEach((element) {
                              element.isSelected = false;
                            });
                            tab.isSelected = true;
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          SizedBox(height: 30),
          Consumer<Projects>(
            builder: (context, value, __) => value.projects.isEmpty
                ? CustomLoadingWidget()
                : ListView.builder(
                    itemBuilder: (conetxt, index) => SingleProjectCard(
                      project: value.projects[index],
                    ),
                    itemCount:
                        value.projects.isEmpty ? 0 : value.projects.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
          ),
        ],
      ),
    );
  }
}
