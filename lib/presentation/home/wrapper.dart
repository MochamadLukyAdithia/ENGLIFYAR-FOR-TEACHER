import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/presentation/home/screens/home_screen.dart';
import 'package:englifyar_teacher/presentation/mission/screens/mission_screen.dart';
import 'package:englifyar_teacher/presentation/profile/screens/profile_screen.dart';

import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  List<Widget> pages = [];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(),
      MissionScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 254),
      body: pages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
        animationCurve: Curves.easeInToLinear,
        index: selectedIndex,
        animationDuration: Duration(
          milliseconds: 300,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: _items(),
      ),
    );
  }

  List<Widget> _items() => [
        Padding(
          padding: EdgeInsets.only(
            top: selectedIndex == 0 ? 0 : 20,
          ),
          child: Column(
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: selectedIndex == 0 ? 0 : 16,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: selectedIndex == 1 ? 0 : 20,
          ),
          child: Column(
            children: [
              Icon(
                Icons.quiz,
                color: Colors.white,
              ),
              Text(
                "Mission",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: selectedIndex == 1 ? 0 : 16,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: selectedIndex == 2 ? 0 : 20,
          ),
          child: Column(
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: selectedIndex == 2 ? 0 : 16,
                ),
              )
            ],
          ),
        ),
      ];
}
