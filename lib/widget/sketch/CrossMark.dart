// ignore_for_file: file_names, overridden_fields

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/sketch/interface/Sketch.dart';

import 'SketchMode.dart';

class CrossMark extends Sketch {
  CrossMark(this.state, double x, double y) {
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
  late final double thickness = state.getSketchThickness(SketchMode.CROSS_MARK);
  @override
  late final double opacity = state.getSketchOpacity(SketchMode.CROSS_MARK);

  @override
  widget() => Stack(
        children: [
          Positioned(
            left: getStartX(),
            top: getStartY(),
            child: CustomPaint(painter: _ArrowSketcher(getStartX(), getStartY(), getFinishX(), getFinishY(), color.withOpacity(opacity), thickness)),
          ),
          Positioned(
            left: getStartX(),
            top: getFinishY(),
            child: CustomPaint(painter: _ArrowSketcher(getStartX(), getFinishY(), getFinishX(), getStartY(), color.withOpacity(opacity), thickness)),
          ),
        ],
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
      path = ArrowPath.make(path: path, tipAngle: 0, tipLength: 0);
      canvas.drawPath(path, paint);
    } catch (_) {}
  }

  @override
  bool shouldRepaint(_ArrowSketcher oldDelegate) => true;
}
