import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/core/usecases/usecase.dart';
import 'package:englifyar_teacher/domain/repositories/mission/mission_repository.dart';
import 'package:englifyar_teacher/service_locator.dart';

class GetAllMissionUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MissionRepository>().getMission();
  }
}
