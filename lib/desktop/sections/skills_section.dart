import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/skill_card.dart';
import 'package:portfolio/providers/skills.dart';
import 'package:provider/provider.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skillData = Provider.of<Skills>(context, listen: false).skills;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      height: 900,
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
                  endIndent: 500,
                  indent: 500,
                ),
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 180 / 180,
              crossAxisSpacing: 60.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) => SkillCard(
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
