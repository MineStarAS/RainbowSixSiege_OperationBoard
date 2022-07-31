// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r6splannerboard/data/Position.dart';

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

  Position getStart() {
    double x;
    double y;

    double? limitedX;
    double? limitedY;

    getX() {
      var posX = startX;

      final center = state.mapWidth / 2;
      final scale = state.getPlayMapScale();
      final offset = state.getPlayMapOffsetX();

      final v1 = center + (((posX - center) / state.mapWidth) * state.mapWidth * scale);
      final v2 = v1 - (offset / 2 * (scale - 1));

      if (v2 < 0) {
        limitedX = v2;
        return 0.0;
      }
      if (v2 > state.mapWidth) {
        limitedX = state.mapWidth - v2;
        return state.mapWidth;
      }
      return v2;
    }

    getY() {
      final posY = startY;

      final center = state.mapHeight / 2;
      final scale = state.getPlayMapScale();
      final offset = state.getPlayMapOffsetY();

      final v1 = center + (((posY - center) / state.mapHeight) * state.mapHeight * scale);
      final v2 = v1 - (offset / 2 * (scale - 1));

      if (v2 < 0) {
        limitedY = v2;
        return 0.0;
      }
      if (v2 > state.mapHeight) {
        limitedY = state.mapHeight - v2;
        return state.mapHeight;
      }
      return v2;
    }

    x = getX();
    y = getY();

    if (limitedX != null) y += limitedX!;
    if (limitedY != null) x += limitedY!;

    return Position(x, y);
  }

  Position getFinish() {
    double x;
    double y;

    double? limitedX;
    double? limitedY;

    getX() {
      var posX = finishX;

      final center = state.mapWidth / 2;
      final scale = state.getPlayMapScale();
      final offset = state.getPlayMapOffsetX();

      final v1 = center + (((posX - center) / state.mapWidth) * state.mapWidth * scale);
      final v2 = v1 - (offset / 2 * (scale - 1));

      if (v2 < 0) {
        limitedX = v2;
        return 0.0;
      }
      if (v2 > state.mapWidth) {
        limitedX = state.mapWidth - v2;
        return state.mapWidth;
      }
      return v2;
    }

    getY() {
      final posY = finishY;

      final center = state.mapHeight / 2;
      final scale = state.getPlayMapScale();
      final offset = state.getPlayMapOffsetY();

      final v1 = center + (((posY - center) / state.mapHeight) * state.mapHeight * scale);
      final v2 = v1 - (offset / 2 * (scale - 1));

      if (v2 < 0) {
        limitedY = v2;
        return 0.0;
      }
      if (v2 > state.mapHeight) {
        limitedY = state.mapHeight - v2;
        return state.mapHeight;
      }
      return v2;
    }

    x = getX();
    y = getY();

    if (limitedX != null) y -= limitedX!;
    if (limitedY != null) y -= limitedY!;

    return Position(x, y);
  }

  getStartX() {
    var posX = startX;

    final center = state.mapWidth / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    final v1 = center + (((posX - center) / state.mapWidth) * state.mapWidth * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    if (v2 < 0) return 0.0;
    if (v2 > state.mapWidth) return state.mapWidth;
    return v2;
  }

  getStartY() {
    final posY = startY;

    final center = state.mapHeight / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    final v1 = center + (((posY - center) / state.mapHeight) * state.mapHeight * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    if (v2 < 0) return 0.0;
    if (v2 > state.mapHeight) return state.mapHeight;
    return v2;
  }

  getFinishX() {
    final posX = finishX;

    final center = state.mapWidth / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    final v1 = center + (((posX - center) / state.mapWidth) * state.mapWidth * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    if (v2 < 0) return 0.0;
    if (v2 > state.mapWidth) return state.mapWidth;
    return v2;
  }

  getFinishY() {
    final posY = finishY;

    final center = state.mapHeight / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    final v1 = center + (((posY - center) / state.mapHeight) * state.mapHeight * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));

    if (v2 < 0) return 0.0;
    if (v2 > state.mapHeight) return state.mapHeight;
    return v2;
  }

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
