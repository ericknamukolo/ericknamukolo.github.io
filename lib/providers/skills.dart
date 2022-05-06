import 'package:flutter/foundation.dart';
import 'package:portfolio/models/skill.dart';

class Skills with ChangeNotifier {
  final List<Skill> _skills = [
    Skill(
      imgPath: 'assets/html5.png',
      skillName: 'HTML',
      desc:
          'The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser.',
    ),
    Skill(
      imgPath: 'assets/css3.png',
      skillName: 'CSS',
      desc:
          'Cascading Style Sheets is a style sheet language used for describing the presentation of a document written in a markup language such as HTML.',
    ),
    Skill(
      imgPath: 'assets/javascript.png',
      skillName: 'JS',
      desc:
          'JS is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.',
    ),
    Skill(
      imgPath: 'assets/git.png',
      skillName: 'Git',
      desc:
          'Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.',
    ),
    Skill(
      imgPath: 'assets/adobe-xd.png',
      skillName: 'Abobe XD',
      desc:
          'Adobe XD is a prototyping tool for user experience and interaction designers used to design websites, mobile apps, and more. Design at the speed of thought.',
    ),
    Skill(
      imgPath: 'assets/flutter.png',
      skillName: 'Flutter',
      desc:
          'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. ',
    ),
    Skill(
      imgPath: 'assets/dart.png',
      skillName: 'Dart',
      desc:
          'Dart is a programming language designed for client development, such as for the web and mobile apps.',
    ),
    Skill(
      imgPath: 'assets/firebase.png',
      skillName: 'Firebase',
      desc:
          'Firebase is a Backend-as-a-Service (Baas). It provides developers with a variety of tools and services to help them develop quality apps. It is built on Google’s infrastructure.',
    ),
    Skill(
      imgPath: 'assets/nodejs.png',
      skillName: 'Node Js',
      desc:
          'Node.js is an open source, cross-platform runtime environment for developing server-side and networking applications. Node.js applications are written in JavaScript, and can be run within the Node.js runtime on OS X, Microsoft Windows, and Linux.',
    ),
  ];

  List<Skill> get skills {
    return [..._skills];
  }
}
