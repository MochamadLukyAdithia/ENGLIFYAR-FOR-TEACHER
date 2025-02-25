import 'dart:ffi';

import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';

class MissionModel {
  String? category;
  String? description;
  double? duration;
  MissionModel({
    required this.category,
    required this.description,
    required this.duration,
  });
  MissionModel.fromJson(Map<String, dynamic> data){
    category = data['category'] as String;
    description = data['description'] as String;
    duration = data['duration'] as double;
  }
}
extension MissionModelX on MissionModel{
  MissionEntity toJson(){
    return MissionEntity(
      category: category,
      description: description,
      duration: duration,
    );
  }
}
