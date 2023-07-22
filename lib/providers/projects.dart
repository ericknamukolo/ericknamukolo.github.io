import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/project.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:portfolio/providers/analytics.dart';

import '../services/notification.dart';

class Projects with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects {
    return [..._projects];
  }

  Future<void> fetchAndSetProjects() async {
    try {
      DatabaseEvent ref = await projectsRef.once();
      var data = (ref.snapshot.value as Map);

      _projects = Project.fromJsonList(data);
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  downloadCV() {
    Analytics.trackVisit(NotificationType.cv);
    String url =
        'https://drive.google.com/uc?id=1egQA4dMBeMb8SQIx4aX6coryumbxsBXX&export=download';
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}
