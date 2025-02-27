import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/data/models/mission/mission_model.dart';
import 'package:englifyar_teacher/data/sources/mission/mission_firebase_service.dart';
import 'package:englifyar_teacher/domain/repositories/mission/mission_repository.dart';
import 'package:englifyar_teacher/service_locator.dart';

class MissionRepositoryImpl extends MissionRepository {
  @override
  Future<Either> addOrRemoveMission(MissionModel misi) async {
    return await sl<MissionFirebaseService>().addOrRemoveMission(misi);
  }

  @override
  Future<Either> getMission() async {
    return await sl<MissionFirebaseService>().getMission();
  }
  
  @override
  Future<Either> getCategory() async{
    return await sl<MissionFirebaseService>().getCategory();
  }
}
