import 'package:flutter/foundation.dart';
import 'package:portfolio/models/project.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Projects with ChangeNotifier {
  List<Project> _projectsAndDesigns = [];

  List<Project> get projectsAndDesigns {
    return [..._projectsAndDesigns];
  }

  Future<void> fetchAndSetProjects() async {
    const url =
        'https://portfolio-28840-default-rtdb.firebaseio.com/projects.json';
    var response = await http.get(Uri.parse(url));
    var projects = json.decode(response.body) as Map<dynamic, dynamic>;
    List<Project> loadedProjects = [];

    projects.forEach(
      (projectId, project) => {
        loadedProjects.add(
          Project(
            id: projectId,
            name: project['name'],
            type: project['type'],
            imgUrl: project['imgUrl'],
            githubLink: project['githubLink'],
            desc: project['desc'],
            images: project['images'],
            dribbbleLink: project['dribbbleLink'],
            externalLink: project['externalLink'],
          ),
        ),
      },
    );
    _projectsAndDesigns = loadedProjects;
    notifyListeners();
  }

  Future<void> add() async {
    await http.post(
      Uri.parse(
          'https://portfolio-28840-default-rtdb.firebaseio.com/projects.json'),
      body: json.encode(
        {
          'name': 'E-Commerce App',
          'type': 'Project',
          'imgUrl': 'assets/dash.png',
          'githubLink': 'https://github.com',
          'desc':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          'images': [
            'assets/dash.png',
            'assets/dash.png',
            'assets/dash.png',
            'assets/dash.png',
            'assets/dash.png',
          ],
        },
      ),
    );
  }
}
