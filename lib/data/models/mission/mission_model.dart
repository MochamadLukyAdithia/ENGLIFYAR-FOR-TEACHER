import 'dart:ffi';

import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';

class MissionModel {
  String? category;
  String? description;
  String? question;
  String? topic;
  MissionModel({
    required this.category,
    required this.description,
    required this.question,
    required this.topic,
  });
  MissionModel.fromJson(Map<String, dynamic> data) {
    category = data['category'] as String;
    description = data['description'] as String;
    question = data['question'] as String;
    question = data['topic'] as String;
  }
}

extension MissionModelX on MissionModel {
  MissionEntity toJson() {
    return MissionEntity(
      category: description,
      description: category,
      question: question!,
    );
  }
}
