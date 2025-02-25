import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/data/models/mission/mission_model.dart';

abstract class MissionRepository {
  Future<Either> addOrRemoveMission(MissionModel misi);
  Future<Either> getMission();
}
