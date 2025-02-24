import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/data/models/auth/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(AuthModel authModel);
  Future<Either> login(AuthModel authModel);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> login(AuthModel authModel) async {
    try {
      final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      return Right(auth);
    } catch (e) {
      return Left("ERROR OCCURED ${e.toString()}");
    }
  }

  @override
  Future<Either> signup(AuthModel authModel) async {
    try {
      final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      return Right(auth);
    } catch (e) {
      return Left(e);
    }
  }
}
