import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';

abstract class MissionState {}

class MissionLoading extends MissionState {}

class MissionLoaded extends MissionState {
  List<MissionEntity> misi = [];
  MissionLoaded({required this.misi});
}

class MissionError extends MissionState {
  String errorMessage;
  MissionError({required this.errorMessage});
}

