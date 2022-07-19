// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../main.dart';

abstract class Sketch {

  late final MyStatefulWidgetState state;

  late final double startX;
  late final double startY;

  late final color = state.sketchColor;

  late final double thickness;
  late final double opacity;

  late double finishX = startX;
  late double finishY = startY;

  setFinishX(double x) {
    if (state.mapWidth < x) {
      finishX = state.mapWidth;
    } else if (x < 0) {
      finishX = 0;
    } else {
      finishX = x;
    }
  }

  setFinishY(double y) {
    if (state.mapHeight < y) {
      finishY = state.mapHeight;
    } else if (y < 0) {
      finishY = 0;
    } else {
      finishY = y;
    }
  }

  Widget widget();
}