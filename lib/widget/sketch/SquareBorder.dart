// ignore_for_file: file_names, overridden_fields

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:r6splannerboard/main.dart';
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
  widget() => Positioned(
      left: min(getStartX(), getFinishX()),
      top: min(getStartY(), getFinishY()),
      child: Container(
          width: (getStartX().abs() - getFinishX().abs()).abs(),
          height: (getStartY().abs() - getFinishY().abs()).abs(),
          decoration: BoxDecoration(
            border: Border.all(color: color.withOpacity(opacity), width: thickness),
          )));
}
