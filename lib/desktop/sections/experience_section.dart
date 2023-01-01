import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/work_title_text.dart';
import 'package:portfolio/providers/experiences.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  final bool isTabMode;
  const ExperienceSection({
    Key? key,
    this.isTabMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isTabMode ? 90.0 : _screenWidth * .1172,
          vertical: isTabMode ? 50.0 : _screenHeight * .065),
      width: double.infinity,
      color: klightDarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Work Experience'),
          Consumer<Experiences>(builder: (context, workData, __) {
            workData.workExperience
                .sort((a, b) => b.startDate.compareTo(a.startDate));
            return ExpansionPanelList.radio(
              children: workData.workExperience
                  .map(
                    (work) => ExpansionPanelRadio(
                      canTapOnHeader: true,
                      backgroundColor: kdarkColor,
                      value: work.id!,
                      headerBuilder: ((context, isExpanded) {
                        return MouseRegion(
                          onEnter: (_) =>
                              workData.triggerAnimation(work.id!, true),
                          onExit: (_) =>
                              workData.triggerAnimation(work.id!, false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      work.position,
                                      style: kNormalTextStyleWhite,
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        if (work.siteUrl != null) {
                                          await launch(work.siteUrl!);
                                        }
                                      },
                                      child: WorkTitleText(work: work),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer_rounded,
                                      color: kprimaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${DateFormat.yMMM().format(DateTime.parse(work.startDate))} - ${work.worksHere ? 'Present' : DateFormat.yMMM().format(DateTime.parse(work.startDate))}',
                                      style: kNormalTextStyleGrey.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(
                                      MdiIcons.mapMarker,
                                      color: kprimaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${work.state}, ${work.country}.',
                                      style: kNormalTextStyleGrey.copyWith(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      body: Column(
                        children: work.workDone
                            .mapIndexed(
                              (i, workDone) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${i + 1}.',
                                      style: kNormalTextStyleGrey.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 6),
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
            );
          }),
        ],
      ),
    );
  }
}
