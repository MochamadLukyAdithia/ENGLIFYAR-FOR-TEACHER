import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/data/models/auth/auth_model.dart';
import 'package:englifyar_teacher/data/sources/auth/auth_firebase_service.dart';
import 'package:englifyar_teacher/domain/repositories/auth/auth_repository.dart';
import 'package:englifyar_teacher/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> login(AuthModel authModel) async{
   return await sl<AuthFirebaseService>().login(authModel);
  }

  @override
  Future<Either> signup(AuthModel authModel) async {
    return await sl<AuthFirebaseService>().signup(authModel);
  }
}
