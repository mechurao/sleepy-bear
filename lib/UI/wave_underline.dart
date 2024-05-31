import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaveUnderline extends StatefulWidget {
  final String text;
  final double minStrokeHeight;
  final double maxStrokeHeight;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;

  WaveUnderline({
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    this.minStrokeHeight = 1.1,
    this.maxStrokeHeight = 2.4,
  });

  @override
  _WaveUnderlineState createState() => _WaveUnderlineState();
}

class _WaveUnderlineState extends State<WaveUnderline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: widget.fontSize,
      fontWeight: widget.fontWeight,
      color: widget.color,
      fontFamily: GoogleFonts.nunito().fontFamily,
    );

    final textSpan = TextSpan(
      text: widget.text,
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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(width, height + 10), // Adjust height to fit the underline
            painter: IrregularWavyUnderlinePainter(
              width * _controller.value,
              widget.minStrokeHeight,
              widget.maxStrokeHeight,
              widget.color,
            ),
            child: Text.rich(
              textSpan,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}

class IrregularWavyUnderlinePainter extends CustomPainter {
  final double animatedWidth;
  final double minStrokeHeight;
  final double maxStrokeHeight;
  final Color color;

  IrregularWavyUnderlinePainter(
      this.animatedWidth, this.minStrokeHeight, this.maxStrokeHeight, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke;

    double startX = 0;
    double startY = size.height + 1; // Position the underline closer to the text

    while (startX < animatedWidth) {
      final remainingWidth = animatedWidth - startX;
      double progress = startX / animatedWidth;
      double waveHeight = 2 + 2 * sin(progress * pi); // Adjust wave height
      final waveLength = min(Random().nextDouble() * 5 + 5, remainingWidth); // Smaller wave length

      path.moveTo(startX, startY);
      path.relativeQuadraticBezierTo(waveLength / 4, -waveHeight, waveLength / 2, 0);
      path.relativeQuadraticBezierTo(waveLength / 4, waveHeight, waveLength / 2, 0);

      progress = startX / animatedWidth;
      double strokeWidth = minStrokeHeight + (maxStrokeHeight - minStrokeHeight) * sin(progress * pi);
      paint.strokeWidth = strokeWidth;

      startX += waveLength;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
