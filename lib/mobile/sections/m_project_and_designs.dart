import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/mobile/widgets/single_project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:portfolio/widgets/custom_toast.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_loading_widget.dart';

class MProjectsAndDesigns extends StatelessWidget {
  const MProjectsAndDesigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Projects & Designs'),
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
          const SizedBox(height: 25),
          BasicButton(
            text: 'Browse All Projects',
            click: () {
              BotToast.showCustomNotification(
                duration: Duration(seconds: 5),
                toastBuilder: (context) => CustomToast(
                  message: 'Relax 🙄 , I\'m still working on that page! 😐',
                  type: 'success',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
