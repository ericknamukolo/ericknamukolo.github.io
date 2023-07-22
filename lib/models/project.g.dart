// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String?,
      playstoreLink: json['playstore_link'] as String,
      name: json['name'] as String,
      date: json['created_at'] as String,
      type: json['type'] as String,
      cover: json['cover_img'] as String,
      githubLink: json['github_link'] as String,
      externalLink: json['external_link'] as String,
      description: json['description'] as String,
      images: json['images'] as List<dynamic>,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'cover_img': instance.cover,
      'github_link': instance.githubLink,
      'external_link': instance.externalLink,
      'playstore_link': instance.playstoreLink,
      'created_at': instance.date,
      'images': instance.images,
    };
