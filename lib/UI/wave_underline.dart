
import 'dart:math';

import 'package:flutter/material.dart';

class WaveUnderline extends StatelessWidget {
  final String text;
  final double minStrokeHeight;
  final double maxStrokeHeight;

  WaveUnderline({required this.text, required this.minStrokeHeight, required this.maxStrokeHeight});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.orange,
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final width = textPainter.width;
    final height = textPainter.height;

    return Baseline(
      baseline: height,
      baselineType: TextBaseline.alphabetic,
      child: CustomPaint(
        size: Size(width, height + 10), // Adjust height to fit the underline
        painter: IrregularWavyUnderlinePainter(width, minStrokeHeight, maxStrokeHeight),
        child: Text.rich(
          textSpan,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class IrregularWavyUnderlinePainter extends CustomPainter {
  final double width;
  final double minStrokeHeight;
  final double maxStrokeHeight;

  IrregularWavyUnderlinePainter(this.width, this.minStrokeHeight, this.maxStrokeHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    double startX = 0;
    double startY = size.height -1; // Position the underline closer to the text

    while (startX < width) {
      final remainingWidth = width - startX;
      double progress = startX / width;
      double waveHeight = 2 + 2 * sin(progress * pi); // Adjust wave height
      final waveLength = min(Random().nextDouble() * 5 + 5, remainingWidth); // Smaller wave length

      path.moveTo(startX, startY);
      path.relativeQuadraticBezierTo(waveLength / 4, -waveHeight, waveLength / 2, 0);
      path.relativeQuadraticBezierTo(waveLength / 4, waveHeight, waveLength / 2, 0);

      progress = startX / width;
      double strokeWidth = minStrokeHeight + (maxStrokeHeight - minStrokeHeight) * sin(progress * pi);
      paint.strokeWidth = strokeWidth;

      canvas.drawPath(path, paint);
      path.reset();
      startX += waveLength;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
