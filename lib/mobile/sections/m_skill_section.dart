import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/mobile/widgets/m_skill_card.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:provider/provider.dart';

class MSkillSection extends StatelessWidget {
  const MSkillSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skillData = Provider.of<Skills>(context, listen: false).skills;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 1500,
      color: kdarkColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: const [
                Text(
                  'Skills',
                  style: kMiniTitleTextStyleWhite,
                ),
                Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 250,
                  indent: 250,
                ),
              ],
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) => MSkillCard(
              name: Provider.of<Skills>(context).skills[index].skillName,
              path: Provider.of<Skills>(context).skills[index].imgPath,
            ),
            itemCount: skillData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
