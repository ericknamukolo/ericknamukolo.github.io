import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:portfolio/tablet/widgets/t_skill_card.dart';
import 'package:provider/provider.dart';

import '../../widgets/section_title.dart';

class TSkillSection extends StatelessWidget {
  const TSkillSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50.0),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Skills'),
          Consumer<Skills>(
              builder: (context, skillData, __) => ListView.builder(
                    itemBuilder: (context, index) => TSkillCard(
                      skill: skillData.skills[index],
                    ),
                    itemCount: skillData.skills.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  )),
        ],
      ),
    );
  }
}
