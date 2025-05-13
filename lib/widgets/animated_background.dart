import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'dart:math';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: CurvedGradientPainter(_controller.value),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}

class CurvedGradientPainter extends CustomPainter {
  final double progress;

  CurvedGradientPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.primaryBackground.withOpacity(1.0),
        Colors.white.withOpacity(0.2),
      ],
    );

    paint.shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * (0.3 + 0.1 * sin(progress * 2 * pi)),
      size.width,
      size.height * 0.3,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CurvedGradientPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}