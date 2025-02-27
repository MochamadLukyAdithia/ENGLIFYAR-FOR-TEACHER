import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/presentation/profile/widgets/crocodile.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background3.webp"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pofile",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: AnimatedCrocodile(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 2.25,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: AppColors.secondaryColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  settingPath(
                    onpressed: () {},
                    screenWidth,
                    image: "setting.gif",
                    text: "Pengaturan Profile",
                  ),
                  Divider(),
                  settingPath(
                    onpressed: () {},
                    screenWidth,
                    image: "email.gif",
                    text: "Ubah Email dan Password",
                  ),
                  Divider(),
                  settingPath(
                    onpressed: () {},
                    screenWidth,
                    image: "logout.gif",
                    text: "Keluar",
                  ),
                  Divider(),
                ],
              ),
            ),
          )
        ],
      ), // Akhir Stack
    );
  }

  GestureDetector settingPath(double screenWidth,
      {required String image,
      required String text,
      required VoidCallback onpressed}) {
    return GestureDetector(
      onTap: onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            height: screenWidth / 5,
            width: screenWidth / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image(
              image: AssetImage("assets/animation/${image}"),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${text}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
