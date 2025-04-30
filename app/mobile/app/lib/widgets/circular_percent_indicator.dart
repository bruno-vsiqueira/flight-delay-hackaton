import 'package:flutter/material.dart';

class CircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent; // Value between 0 and 1
  final Widget? center;
  final Color progressColor;
  final Color backgroundColor;
  final bool animate;
  final Duration animationDuration;

  const CircularPercentIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.percent,
    this.center,
    this.progressColor = Colors.blue,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.animate = false,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: 0,
          end: percent.clamp(0, 1),
        ),
        duration: animate ? animationDuration : Duration.zero,
        builder: (context, value, child) {
          return CustomPaint(
            painter: _CircularPercentPainter(
              percent: value,
              lineWidth: lineWidth,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
            ),
            child: Center(child: center ?? const SizedBox.shrink()),
          );
        },
      ),
    );
  }
}

class _CircularPercentPainter extends CustomPainter {
  final double percent;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;

  _CircularPercentPainter({
    required this.percent,
    required this.lineWidth,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - lineWidth) / 2;
    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, bgPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final sweepAngle = 2 * 3.141592653589793 * percent;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
