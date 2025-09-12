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

  double getStartX() {
    var pos = startX;

    final center = state.mapWidth() / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    final v1 = center + (((pos - center) / state.mapWidth()) * state.mapWidth() * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    return v2;
  }

  double getStartY() {
    var pos = startY;

    final center = state.mapHeight() / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    final v1 = center + (((pos - center) / state.mapHeight()) * state.mapHeight() * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    return v2;
  }
  double getFinishX() {
    var pos = finishX;

    final center = state.mapWidth() / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    final v1 = center + (((pos - center) / state.mapWidth()) * state.mapWidth() * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    return v2;
  }

  double getFinishY() {
    var pos = finishY;

    final center = state.mapHeight() / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    final v1 = center + (((pos - center) / state.mapHeight()) * state.mapHeight() * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    return v2;
  }

  setFinishX(double x) {
    final center = state.mapWidth() / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    finishX = (((x - center) + (offset / 2 * (scale - 1))) / state.mapWidth() / scale * state.mapWidth()) + center;
  }

  setFinishY(double y) {
    final center = state.mapHeight() / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    finishY = (((y - center) + (offset / 2 * (scale - 1))) / state.mapHeight() / scale * state.mapHeight()) + center;
  }

  Widget widget();
}
