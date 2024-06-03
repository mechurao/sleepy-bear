import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Background extends StatefulWidget {
  final Widget child;

  Background({required this.child});

  @override
  _BackgroundState createState() => _BackgroundState();

  // Metody pro přibližování a oddalování
  void zoomIn(BuildContext context) {
    final state = context.findAncestorStateOfType<_BackgroundState>();
    state?._zoomIn();
  }

  void zoomOut(BuildContext context) {
    final state = context.findAncestorStateOfType<_BackgroundState>();
    state?._zoomOut();
  }
}

class _BackgroundState extends State<Background> with SingleTickerProviderStateMixin {
  final TransformationController _transformationController = TransformationController();
  late AnimationController _animationController;
  late Animation<Matrix4> _animation;
  double _currentScale = 1.0;
  Offset _currentOffset = Offset.zero;
  int _zoomLevel = 0;
  late BoxConstraints _constraints;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
      _transformationController.value = _animation.value;
    });
  }

  Offset _calculateOffset(double scale) {
    final offsetX = (_constraints.maxWidth * 0.55) * (scale - 1); // Adjust the target position dynamically
    final offsetY = (_constraints.maxHeight * 0.70) * (scale - 1); // Adjust the target position dynamically
    return Offset(offsetX, offsetY);
  }

  void _zoomIn() {
    setState(() {
      _zoomLevel++;
      double newScale;
      Offset newOffset;
      switch (_zoomLevel) {
        case 1:
          newScale = 2.0;
          break;
        case 2:
          newScale = 4.0;
          break;
        case 3:
          newScale = 8.0;
          break;
        default:
          _zoomLevel = 3; // Prevent zooming further
          newScale = _currentScale;
          newOffset = _currentOffset;
          break;
      }
      newOffset = _calculateOffset(newScale);
      _animateTransform(newScale, newOffset);
    });
  }

  void _zoomOut() {
    setState(() {
      _zoomLevel--;
      double newScale;
      Offset newOffset;
      switch (_zoomLevel) {
        case 0:
          newScale = 1.0;
          newOffset = Offset.zero; // Initial position
          break;
        case 1:
          newScale = 2.0;
          break;
        case 2:
          newScale = 4.0;
          break;
        default:
          _zoomLevel = 0; // Prevent zooming out further
          newScale = _currentScale;
          newOffset = _currentOffset;
          break;
      }
      newOffset = _calculateOffset(newScale);
      _animateTransform(newScale, newOffset);
    });
  }

  void _animateTransform(double newScale, Offset newOffset) {
    final begin = _transformationController.value;
    final end = Matrix4.identity()
      ..translate(-newOffset.dx, -newOffset.dy)
      ..scale(newScale);
    _animation = Matrix4Tween(begin: begin, end: end).animate(_animationController);
    _currentScale = newScale;
    _currentOffset = newOffset;
    _animationController.forward(from: 0);
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _constraints = constraints;
        return Stack(
          children: [
            Positioned.fill(
              child: Lottie.asset(
                'assets/background/background.json',
                fit: BoxFit.cover,
                frameRate: const FrameRate(30),
              ),
            ),
            InteractiveViewer(
              transformationController: _transformationController,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              minScale: 1.0,
              maxScale: 8.0,
              panEnabled: false,
              scaleEnabled: false,
              child: widget.child,
            ),
          ],
        );
      },
    );
  }
}
