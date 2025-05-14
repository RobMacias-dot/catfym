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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
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

    // 🎨 Capa base (color principal CATFYM)
    paint.color = const Color(0xFF4EB8B1);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // 🎨 Capa 1 (curva clara animada)
    final path1 = Path();
    path1.moveTo(0, size.height * 0.5);
    path1.quadraticBezierTo(
      size.width * 0.5,
      size.height * (0.5 + 0.1 * sin(progress * pi * 2)),
      size.width,
      size.height * 0.4,
    );
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    paint.color = const Color(0xCCB9E3DF); // turquesa claro translúcido
    canvas.drawPath(path1, paint);

    // 🎨 Capa 2 (curva más blanca)
    final path2 = Path();
    path2.moveTo(0, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width * 0.6,
      size.height * (0.75 + 0.1 * cos(progress * pi * 2)),
      size.width,
      size.height * 0.8,
    );
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    paint.color = const Color(0x99FFFFFF); // blanco translúcido
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CurvedGradientPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}