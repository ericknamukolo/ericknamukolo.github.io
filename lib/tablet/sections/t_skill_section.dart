import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:portfolio/tablet/widgets/t_skill_card.dart';
import 'package:provider/provider.dart';

class TSkillSection extends StatelessWidget {
  const TSkillSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skillData = Provider.of<Skills>(context, listen: false).skills;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      width: double.infinity,
      height: 1900,
      color: kdarkColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
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
            itemBuilder: (context, index) => TSkillCard(
              skillName: skillData[index].skillName,
              path: skillData[index].imgPath,
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
