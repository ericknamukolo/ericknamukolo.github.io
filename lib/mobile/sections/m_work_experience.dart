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
import 'package:time_machine/time_machine.dart';

class MWorkExperience extends StatelessWidget {
  const MWorkExperience({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      width: double.infinity,
      color: klightDarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Work Experience'),
          Consumer<Experiences>(builder: (context, expData, __) {
            expData.workExperience
                .sort((a, b) => b.startDate.compareTo(a.startDate));
            return ExpansionPanelList.radio(
              children: expData.workExperience
                  .map((work) => ExpansionPanelRadio(
                        canTapOnHeader: true,
                        backgroundColor: kdarkColor,
                        value: work.id!,
                        headerBuilder: ((context, isExpanded) {
                          LocalDate a;
                          if (work.worksHere) {
                            a = LocalDate.today();
                          } else {
                            a = LocalDate.dateTime(
                                DateTime.parse(work.endDate!));
                          }
                          LocalDate b = LocalDate.dateTime(
                              DateTime.parse(work.startDate));
                          Period diff = a.periodSince(b);
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      work.position,
                                      style: kNormalTextStyleWhite.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (work.siteUrl != null) {
                                          await launch(work.siteUrl!);
                                        }
                                      },
                                      child: WorkTitleText(
                                          work: work, isMobile: true),
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
                                    const SizedBox(width: 6),
                                    Text(
                                      '${DateFormat.yMMM().format(DateTime.parse(work.startDate))} - ${work.worksHere ? 'Present' : DateFormat.yMMM().format(DateTime.parse(work.endDate!))}',
                                      style: kNormalTextStyleGrey.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Icon(
                                        MdiIcons.circle,
                                        color: kprimaryColor,
                                        size: 8,
                                      ),
                                    ),
                                    Text(
                                      '${diff.years == 0 ? '${diff.months} ${diff.months >= 2 ? 'months' : 'month'} ${diff.days} days' : '${diff.years} ${diff.years >= 2 ? 'years' : 'year'} ${diff.months} months'}',
                                      style: kNormalTextStyleGrey.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      MdiIcons.mapMarker,
                                      color: kprimaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 6),
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
                          );
                        }),
                        body: Column(
                          children: work.workDone
                              .mapIndexed(
                                (i, workDone) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${i + 1}.',
                                        style: kNormalTextStyleGrey.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
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
                      ))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
