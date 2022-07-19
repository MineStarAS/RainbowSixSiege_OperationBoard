// ignore_for_file: file_names, overridden_fields

import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:r6splannerboard/main.dart';
import 'package:r6splannerboard/widget/sketch/interface/Sketch.dart';

import 'SketchMode.dart';

class Circle extends Sketch {
  Circle(this.state, this.startX, this.startY);

  @override
  final MyStatefulWidgetState state;

  @override
  final double startX;
  @override
  final double startY;

  @override
  late final double thickness = state.getSketchThickness(SketchMode.CIRCLE);
  @override
  late final double opacity = state.getSketchOpacity(SketchMode.CIRCLE);

  @override
  widget() => Container(
    width: (startX.abs() - finishX.abs()).abs(),
    height: (startY.abs() - finishY.abs()).abs(),
    margin: EdgeInsets.only(left: min(startX, finishX), top: min(startY, finishY)),
    decoration: BoxDecoration(
      border: Border.all(color: color.withOpacity(opacity), width: thickness),
      shape: BoxShape.circle
    ),
  );
}

class _ArrowSketcher extends CustomPainter {
  _ArrowSketcher(this._startX, this._startY, this._finishX, this._finishY, this._color, this._thickness);

  final double _startX;
  final double _startY;
  final double _finishX;
  final double _finishY;

  final Color _color;
  final double _thickness;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = _thickness;

    path.moveTo(0, 0);
    path.relativeCubicTo(0, 0, 0, 0, _finishX - _startX, _finishY - _startY);
    try {
      path = ArrowPath.make(path: path, tipAngle: 0);
      canvas.drawPath(path, paint);
    } catch (_) {}
  }

  @override
  bool shouldRepaint(_ArrowSketcher oldDelegate) => true;
}
