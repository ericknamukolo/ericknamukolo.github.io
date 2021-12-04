import 'package:flutter/foundation.dart';
import 'package:portfolio/models/skill.dart';

class Skills with ChangeNotifier {
  final List<Skill> _skills = [
    Skill(imgPath: 'assets/html5.png', skillName: 'HTML'),
    Skill(imgPath: 'assets/css3.png', skillName: 'CSS'),
    Skill(imgPath: 'assets/javascript.png', skillName: 'JS'),
    Skill(imgPath: 'assets/git.png', skillName: 'Git'),
    Skill(imgPath: 'assets/adobe-xd.png', skillName: 'Abobe XD'),
    Skill(imgPath: 'assets/flutter.png', skillName: 'Flutter'),
    Skill(imgPath: 'assets/dart.png', skillName: 'Dart'),
    Skill(imgPath: 'assets/firebase.png', skillName: 'Firebase'),
    Skill(imgPath: 'assets/sqlite.png', skillName: 'SQLite'),
  ];

  List<Skill> get skills {
    return [..._skills];
  }
}
