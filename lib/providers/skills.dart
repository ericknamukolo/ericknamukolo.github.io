import 'package:flutter/foundation.dart';
import 'package:portfolio/models/skill.dart';

import '../constants/constants.dart';

class Skills with ChangeNotifier {
  final List<double> pages = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  void triggerSelection(int index) {
    pages[0] = 0.0;
    pages[1] = 0.0;
    pages[2] = 0.0;
    pages[3] = 0.0;
    pages[4] = 0.0;
    pages[5] = 0.0;

    pages[index] = 45.0;
    notifyListeners();
  }

  List<Skill> _skills = [];

  Future<void> fetchSkills() async {
    try {
      var ref = await adminRef.child('skills').once();
      var data = (ref.snapshot.value as Map);
      List<Skill> _loadedSkills = [];
      data.forEach((key, skillData) {
        if (!skillData['hidden']) {
          _loadedSkills.add(
            Skill(
              id: key,
              des: skillData['des'],
              iconUrl: skillData['img'],
              name: skillData['name'],
            ),
          );
        }
      });
      _skills = _loadedSkills;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  List<Skill> get skills => [..._skills];
}
