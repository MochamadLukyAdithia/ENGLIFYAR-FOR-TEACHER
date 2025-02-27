import 'package:englifyar_teacher/data/repositories/auth/auth_repository_impl.dart';
import 'package:englifyar_teacher/data/repositories/mission/mission_repository_impl.dart';
import 'package:englifyar_teacher/data/sources/auth/auth_firebase_service.dart';
import 'package:englifyar_teacher/data/sources/mission/mission_firebase_service.dart';
import 'package:englifyar_teacher/domain/repositories/auth/auth_repository.dart';
import 'package:englifyar_teacher/domain/repositories/mission/mission_repository.dart';
import 'package:englifyar_teacher/domain/usecases/auth/login_usecase.dart';
import 'package:englifyar_teacher/domain/usecases/auth/signup_usecase.dart';
import 'package:englifyar_teacher/domain/usecases/mission/get_all_usecase.dart';
import 'package:englifyar_teacher/domain/usecases/mission/mission_add.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;
Future<void> initialDepedency() async {
  //auth
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());

  //mission
  sl.registerSingleton<AddOrRemoveMissionUsecase>(AddOrRemoveMissionUsecase());
  sl.registerSingleton<MissionRepository>(MissionRepositoryImpl());
  sl.registerSingleton<MissionFirebaseService>(MissionFirebaseServiceImpl());
  sl.registerSingleton<GetAllMissionUseCase>(GetAllMissionUseCase());


  //
}
