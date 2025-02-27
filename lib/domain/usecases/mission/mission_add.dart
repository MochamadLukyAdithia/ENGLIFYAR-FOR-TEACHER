import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/core/usecases/usecase.dart';
import 'package:englifyar_teacher/data/models/mission/mission_model.dart';
import 'package:englifyar_teacher/domain/repositories/mission/mission_repository.dart';
import 'package:englifyar_teacher/service_locator.dart';

class AddOrRemoveMissionUsecase implements Usecase<Either, MissionModel> {
  @override
  Future<Either> call({MissionModel? params}) async {
    return await sl<MissionRepository>().addOrRemoveMission(params!);
  }
}
