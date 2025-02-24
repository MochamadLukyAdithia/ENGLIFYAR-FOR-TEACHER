import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/core/usecases/usecase.dart';
import 'package:englifyar_teacher/data/models/auth/auth_model.dart';
import 'package:englifyar_teacher/domain/repositories/auth/auth_repository.dart';
import 'package:englifyar_teacher/service_locator.dart';

class SignupUsecase implements Usecase<Either, AuthModel> {
  @override
  Future<Either> call({AuthModel? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
