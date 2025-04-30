import 'package:flutter/material.dart';

class LinearPercentIndicator extends StatelessWidget {
  final double percent;
  final double lineHeight;
  final Color backgroundColor;
  final Color progressColor;
  final Radius barRadius;
  final Duration animationDuration;

  const LinearPercentIndicator({
    super.key,
    required this.percent,
    this.lineHeight = 16,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = Colors.blue,
    this.barRadius = const Radius.circular(8),
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return Container(
        width: width,
        height: lineHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(barRadius),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              width: width * percent.clamp(0, 1),
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.all(barRadius),
              ),
            ),
          ],
        ),
      );
    });
  }
}
