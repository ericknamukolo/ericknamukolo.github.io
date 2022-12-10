import 'package:flutter/material.dart';
import 'package:portfolio/models/experience.dart';

class Experiences with ChangeNotifier {
  List<Experience> get workExperience => _workExperience;
  final List<Experience> _workExperience = [
    Experience(
        id: 0,
        title: 'Software Engineer',
        workPlace: 'Lassod Consulting Limited',
        location: 'Gravesend, England.',
        workDone: [
          'Write modern, performant, maintainable code for a diverse array of client and internal projects with Flutter',
          'Communicate with multi-disciplinary teams of engineers, designers and clients on a daily basis',
          'Work with a variety of different languages, platforms, frameworks, and content management systems such as Dart, Flutter, Github, Gitlab, Jira and Time Management'
        ],
        duration: 'Mar 2022 - Present',
        url: 'https://lassod.com',
        type: 'Full - Time (Remote)'),
    Experience(
        id: 1,
        title: 'UI / UX Designer & Flutter Developer',
        workPlace: 'Omnis Corporation',
        location: 'Lusaka, Zambia.',
        workDone: [
          'Designed clean & Simple yet thoughtful UI/UX design patterns for both mobile and web applications.',
          'Built both mobile and web applications with interactive & responsive layouts.',
          'API integrations throughout a software to keep data in sync and enhance productivity.'
        ],
        duration: 'Jan 2021 - Mar 2022',
        url: null,
        type: 'Part - Time'),
  ];

  void triggerAnimation(int id, bool hover) {
    Experience bs = _workExperience.firstWhere((element) => element.id == id);
    bs.isHovered = hover;
    notifyListeners();
  }
}
