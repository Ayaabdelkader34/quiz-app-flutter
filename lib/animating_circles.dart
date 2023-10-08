import 'package:flutter/material.dart';

class AnimatingCircles extends StatefulWidget {
  const AnimatingCircles({super.key});

  @override
  State<AnimatingCircles> createState() => _AnimatingCirclesState();
}

class _AnimatingCirclesState extends State<AnimatingCircles> {
  bool isFirstCircleVisible = false;
  bool isSecondCircleVisible = false;
  bool isThirdCircleVisible = true;

  @override
  void initState() {
    super.initState();
    _showCircles();
  }

  void _showCircles() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isSecondCircleVisible = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isFirstCircleVisible = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isSecondCircleVisible = false;
        isFirstCircleVisible = false;
        isThirdCircleVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(250, 250),
      painter: CirclePainter(
        isThirdCircleVisible,
        isSecondCircleVisible,
        isFirstCircleVisible,
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final bool isThirdCircleVisible;
  final bool isSecondCircleVisible;
  final bool isFirstCircleVisible;

  CirclePainter(
    this.isThirdCircleVisible,
    this.isSecondCircleVisible,
    this.isFirstCircleVisible,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey[100]!
      ..style = PaintingStyle.fill;

    final Paint paint1 = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.fill;

    final Paint paint2 = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius1 = size.width / 2 - 10;
    final radius2 = radius1 - 20;
    final radius3 = radius2 - 20;

    if (isThirdCircleVisible) {
      canvas.drawCircle(center, radius3, paint2);
    }
    if (isSecondCircleVisible) {
      canvas.drawCircle(center, radius2, paint1);
    }
    if (isFirstCircleVisible) {
      canvas.drawCircle(center, radius1, paint);
    }
  }

  @override
  bool shouldRepaint( covariant CustomPainter oldDelegate) {
    return true;
  }
}
