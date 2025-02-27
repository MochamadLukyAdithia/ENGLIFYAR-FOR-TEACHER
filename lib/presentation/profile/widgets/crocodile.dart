import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedCrocodile extends StatefulWidget {
  final Color color;
  const AnimatedCrocodile({Key? key, required this.color}) : super(key: key);

  @override
  _AnimatedCrocodileState createState() => _AnimatedCrocodileState();
}

class _AnimatedCrocodileState extends State<AnimatedCrocodile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    // );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: CrocodilePainter(
        color: widget.color,
        circleColor: widget.color,
        rotationAngle: _rotationAnimation.value,
      ),
    );
  }
}

class CrocodilePainter extends CustomPainter {
  final Color color;
  final Color circleColor;
  final double rotationAngle; // Animasi rotasi lingkaran luar

  CrocodilePainter({
    required this.color,
    required this.circleColor,
    this.rotationAngle = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;
    canvas.drawCircle(center, radius, paint);

    Paint eyePaint = Paint()..color = Colors.white;
    Paint pupilPaint = Paint()..color = Colors.black;

    Offset leftEye = Offset(size.width * 0.35, size.height * 0.35);
    Offset rightEye = Offset(size.width * 0.65, size.height * 0.35);

    double eyeRadius = size.width * 0.12;
    double pupilRadius = size.width * 0.06;

    canvas.drawCircle(leftEye, eyeRadius, eyePaint);
    canvas.drawCircle(rightEye, eyeRadius, eyePaint);
    canvas.drawCircle(leftEye, pupilRadius, pupilPaint);
    canvas.drawCircle(rightEye, pupilRadius, pupilPaint);

    Paint nostrilPaint = Paint()..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width * 0.45, size.height * 0.7), 4, nostrilPaint);
    canvas.drawCircle(
        Offset(size.width * 0.55, size.height * 0.7), 4, nostrilPaint);

    Paint teethPaint = Paint()..color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.2, size.height * 0.55, 8, 12),
        const Radius.circular(2),
      ),
      teethPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.65, 6, 10),
        const Radius.circular(2),
      ),
      teethPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.65, size.height * 0.65, 6, 10),
        const Radius.circular(2),
      ),
      teethPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.75, size.height * 0.55, 8, 12),
        const Radius.circular(2),
      ),
      teethPaint,
    );

    Paint arcPaint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    // Menyimpan state transformasi
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    canvas.translate(-center.dx, -center.dy);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 1.2),
      -math.pi * 0.7,
      math.pi * 1.4,
      false,
      arcPaint,
    );

    // Mengembalikan state transformasi agar tidak mempengaruhi elemen lain
    canvas.restore();
  }

  @override
  bool shouldRepaint(CrocodilePainter oldDelegate) =>
      oldDelegate.rotationAngle != rotationAngle;
}
