import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/work_title_text.dart';
import 'package:portfolio/providers/experiences.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Consumer<Experiences>(
            builder: (context, expData, __) => ExpansionPanelList.radio(
              children: expData.workExperience
                  .map((work) => ExpansionPanelRadio(
                        canTapOnHeader: true,
                        backgroundColor: kdarkColor,
                        value: work.id,
                        headerBuilder: ((context, isExpanded) {
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
                                      work.title,
                                      style: kNormalTextStyleWhite.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (work.url != null) {
                                          await launch(work.url!);
                                        }
                                      },
                                      child: WorkTitleText(
                                        title: work.workPlace,
                                        isMobile: true,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      work.duration,
                                      style: kNormalTextStyleGrey.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(
                                      MdiIcons.circle,
                                      color: kprimaryColor,
                                      size: 4,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      work.type,
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
                              .map(
                                (workDone) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        MdiIcons.menuRight,
                                        color: kprimaryColor,
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
            ),
          ),
        ],
      ),
    );
  }
}
