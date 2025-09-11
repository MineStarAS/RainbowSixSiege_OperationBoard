import 'dart:math';

import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/sketch/interface/Sketch.dart';

import 'SketchMode.dart';

class Circle extends Sketch {
  Circle(this.state, double x, double y) {
    final centerX = state.mapWidth / 2;
    final centerY = state.mapHeight / 2;
    final offsetX = state.getPlayMapOffsetX();
    final offsetY = state.getPlayMapOffsetY();
    final scale = state.getPlayMapScale();

    startX = (((x - centerX) + (offsetX / 2 * (scale - 1))) / state.mapWidth / scale * state.mapWidth) + centerX;
    startY = (((y - centerY) + (offsetY / 2 * (scale - 1))) / state.mapHeight / scale * state.mapHeight) + centerY;
  }

  @override
  final MyStatefulWidgetState state;

  @override
  late final double startX;
  @override
  late final double startY;

  @override
  late final double thickness = state.getSketchThickness(SketchMode.CIRCLE);
  @override
  late final double opacity = state.getSketchOpacity(SketchMode.CIRCLE);

  @override
  widget() {
    final double width;
    if (getStartX().isNegative != getFinishX().isNegative) {
      width = (getStartX().abs() + getFinishX().abs()).abs();
    } else {
      width = (getStartX().abs() - getFinishX().abs()).abs();
    }

    final double height;
    if (getStartY().isNegative != getFinishY().isNegative) {
      height = (getStartY().abs() + getFinishY().abs()).abs();
    } else {
      height = (getStartY().abs() - getFinishY().abs()).abs();
    }

    return Positioned(
      left: min(getStartX(), getFinishX()),
      top: min(getStartY(), getFinishY()),
      child: CustomPaint(
        size: Size(width, height),
        painter: EllipsePainter(
          color: color,
          thickness: thickness,
          opacity: opacity,
        ),
      ),
    );
  }
}

class EllipsePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double opacity;

  EllipsePainter({
    required this.color,
    required this.thickness,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
