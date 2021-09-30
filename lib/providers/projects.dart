import 'package:flutter/foundation.dart';
import 'package:portfolio/models/project.dart';

class Projects with ChangeNotifier {
  final List<Project> _projectsAndDesigns = [
    Project(
        id: '1',
        name: 'Portfolio Site',
        type: 'Project',
        imgUrl: 'assets/dash.png',
        githubLink: 'https://github.com',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    Project(
        id: '2',
        name: 'Mobill',
        type: 'Project',
        imgUrl: 'assets/dash.png',
        githubLink: 'https://google.com',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    Project(
        id: '3',
        name: 'Picture Perfect',
        type: 'UI Design',
        imgUrl: 'assets/dash.png',
        githubLink: 'https://github.com',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ];

  List<Project> get projectsAndDesigns {
    return [..._projectsAndDesigns];
  }
}
