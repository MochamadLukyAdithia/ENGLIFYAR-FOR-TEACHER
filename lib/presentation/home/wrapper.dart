import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/presentation/home/screens/home_screen.dart';
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
      Center(child: Icon(Icons.search, size: 100, color: Colors.green)),
      Center(child: Icon(Icons.person, size: 100, color: Colors.red)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: pages[
          selectedIndex], // Tidak akan error karena `pages` sudah diinisialisasi
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.secondaryColor,
        backgroundColor: AppColors.primaryColor,
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
        Icon(
          Icons.quiz,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          color: Colors.white,
        ), // Menggunakan `Icons` yang sudah ada di Flutter SDK
      ];
}
