import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/data/models/auth/auth_model.dart';

abstract class AuthRepository {
  Future<Either> login(AuthModel authModel);
  Future<Either> signup(AuthModel authModel);
}
