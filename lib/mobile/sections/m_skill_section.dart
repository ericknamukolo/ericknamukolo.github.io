import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/mobile/widgets/m_skill_card.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:provider/provider.dart';

class MSkillSection extends StatelessWidget {
  const MSkillSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          SectionTitle(title: 'Skills'),
          Consumer<Skills>(
            builder: (context, skillData, __) => ListView.builder(
              itemBuilder: (context, index) => MSkillCard(
                skill: skillData.skills[index],
              ),
              itemCount: skillData.skills.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
