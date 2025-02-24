import 'package:englifyar_teacher/data/repositories/auth/auth_repository_impl.dart';
import 'package:englifyar_teacher/data/sources/auth/auth_firebase_service.dart';
import 'package:englifyar_teacher/domain/repositories/auth/auth_repository.dart';
import 'package:englifyar_teacher/domain/usecases/auth/login_usecase.dart';
import 'package:englifyar_teacher/domain/usecases/auth/signup_usecase.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;
Future<void> initialDepedency() async {
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
}
