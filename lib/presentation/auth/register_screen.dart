import 'package:englifyar_teacher/core/assets/images/app_image_network.dart';
import 'package:englifyar_teacher/data/models/auth/auth_model.dart';

import 'package:englifyar_teacher/domain/usecases/auth/signup_usecase.dart';
import 'package:englifyar_teacher/presentation/auth/login_screen.dart';
import 'package:englifyar_teacher/service_locator.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(AppImagesNetwork.register),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                    ),
                    TextFormField(
                      controller: _emailController,
                    ),
                    TextFormField(
                      controller: _passwordController,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final auth = await sl<SignupUsecase>().call(
                            params: AuthModel(
                          name: _usernameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ));
                        auth.fold((l) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(l.toString()),
                          ));
                        }, (r) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        });
                      },
                      child: Container(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
