import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/work_title_text.dart';
import 'package:portfolio/providers/experiences.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  final bool isTabMode;
  const ExperienceSection({
    Key? key,
    this.isTabMode = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isTabMode ? 90 : 160),
      width: double.infinity,
      color: klightDarkColor,
      height: 600,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: const [
                Text(
                  'Work Experience',
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
          Consumer<Experiences>(
            builder: (context, workData, __) => ExpansionPanelList.radio(
              // dividerColor: kprimaryColor,
              children: workData.workExperience
                  .map(
                    (work) => ExpansionPanelRadio(
                      canTapOnHeader: true,
                      backgroundColor: kdarkColor,
                      value: work.id,
                      headerBuilder: ((context, isExpanded) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    work.title,
                                    style: kNormalTextStyleWhite,
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      if (work.url != null) {
                                        await launch(work.url!);
                                      }
                                    },
                                    child: WorkTitleText(title: work.workPlace),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    work.duration,
                                    style: kNormalTextStyleGrey.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    MdiIcons.circle,
                                    color: kprimaryColor,
                                    size: 5,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    work.type,
                                    style: kNormalTextStyleGrey.copyWith(
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                      body: Column(
                        children: work.workDone
                            .map(
                              (workDone) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      MdiIcons.menuRight,
                                      color: kprimaryColor,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      width: 600,
                                      child: Text(
                                        workDone,
                                        style: kNormalTextStyleGrey.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
