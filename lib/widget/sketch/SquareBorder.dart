// ignore_for_file: file_names, overridden_fields

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:r6splannerboard/Main.dart';
import 'package:r6splannerboard/widget/sketch/interface/Sketch.dart';

import 'SketchMode.dart';

class SquareBorder extends Sketch {
  SquareBorder(this.state, this.startX, this.startY);

  @override
  final MyStatefulWidgetState state;

  @override
  final double startX;
  @override
  final double startY;

  @override
  late final double thickness = state.getSketchThickness(SketchMode.SQUARE_BORDER);
  @override
  late final double opacity = state.getSketchOpacity(SketchMode.SQUARE_BORDER);

  @override
  widget() => Container(
        width: (startX.abs() - finishX.abs()).abs(),
        height: (startY.abs() - finishY.abs()).abs(),
        margin: EdgeInsets.only(left: min(startX, finishX), top: min(startY, finishY)),
    decoration: BoxDecoration(
      border: Border.all(color: color.withOpacity(opacity), width: thickness),
    ),
      );
}
