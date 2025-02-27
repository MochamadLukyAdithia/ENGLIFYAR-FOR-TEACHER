import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';

abstract class MissionCategoryState {}

class MissionCategoryLoading extends MissionCategoryState {}

class MissionCategoryLoaded extends MissionCategoryState {
  List<MissionEntity> misi = [];
  MissionCategoryLoaded({required this.misi});
}

class MissionCategoryError extends MissionCategoryState {
  String errorMessage;
  MissionCategoryError({required this.errorMessage});
}
