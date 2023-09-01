import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'project.g.dart';

@JsonSerializable()
class Project {
  String? id;
  final String name;
  final String type;
  final String description;
  @JsonKey(name: 'cover_img')
  final String cover;
  @JsonKey(name: 'github_link')
  final String githubLink;
  @JsonKey(name: 'external_link')
  final String externalLink;
  @JsonKey(name: 'playstore_link')
  final String playstoreLink;
  @JsonKey(name: 'created_at')
  final String date;
  final List<String> images;
  final List<String> tech;
  @JsonKey(name: 'is_personal')
  final bool isPersonal;

  Project({
    this.id,
    required this.playstoreLink,
    required this.name,
    required this.date,
    required this.type,
    required this.cover,
    required this.githubLink,
    required this.externalLink,
    required this.description,
    required this.images,
    required this.tech,
    required this.isPersonal,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  static List<Project> fromJsonList(Map<dynamic, dynamic> dataList) {
    List<Project> _loadedprojects = [];
    dataList.forEach((id, element) {
      String rawJson = jsonEncode(element);
      Project project = Project.fromJson(jsonDecode(rawJson));
      project.id = id;
      _loadedprojects.add(project);
    });
    return _loadedprojects;
  }
}
