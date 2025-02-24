import 'package:englifyar_teacher/domain/entities/auth/auth_entity.dart';

class AuthModel {
  String? name;
  String password;
  String email;
  AuthModel({
     this.name,
    required this.email,
    required this.password,
  });
 
}


