import 'package:flutter/material.dart';

class TryScreen extends StatelessWidget {
  final List<bool> levelsUnlocked = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 900, // Pastikan Stack cukup tinggi agar bisa di-scroll
          child: Stack(
            children: [
              // Header Hijau
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 120,
                child: Container(
                  color: Colors.green,
                ),
              ),

              // Loop untuk membuat lingkaran
              ...List.generate(levelsUnlocked.length, (index) {
                int value = 4;
                double leftPosition;

                if (index % value == 0) {
                  leftPosition = 300;
                } else if (index % value == 1) {
                  leftPosition = 220;
                } else if (index % value == 2) {
                  leftPosition = 140;
                } else if (index % value == 3) {
                  leftPosition = 60;
                } else {
                  leftPosition = (180 / (value - 1)) * (index % (value - 1));
                }

                double topOffset = 150 + (index * 80);

                return Positioned(
                  left: leftPosition,
                  top: topOffset,
                  child: GestureDetector(
                    onTap: levelsUnlocked[index]
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(level: index + 1),
                              ),
                            );
                          }
                        : null,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: levelsUnlocked[index]
                            ? Colors.green
                            : Colors.grey[300],
                        border: index == 0
                            ? Border.all(
                                color: Colors.yellow,
                                width: 4) // Efek lingkaran kuning di "START"
                            : null,
                      ),
                      child: Center(
                        child: Icon(
                          levelsUnlocked[index] ? Icons.star : Icons.lock,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Detail Level
class DetailScreen extends StatelessWidget {
  final int level;
  DetailScreen({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Level $level")),
      body: Center(
        child: Text(
          "Ini adalah halaman Level $level",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
