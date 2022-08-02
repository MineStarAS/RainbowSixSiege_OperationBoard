// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r6splannerboard/widget/panel/interface/OptionPanel.dart';

abstract class MoveIcon extends OptionPanel {
  late double posX;
  late double posY;

  late final double minSize = state.minMoveIconSize;
  late final double maxSize = state.maxMoveIconSize;
  late double currentSize = state.defaultMoveIconSize;

  getPosX() {
    final center = state.mapWidth / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    final v1 = center + (((posX - center) / state.mapWidth) * center * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));
    return v2;
  }

  getPosY() {
    final center = state.mapHeight / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    final v1 = center + (((posY - center) / state.mapHeight) * center * scale);
    final v2 = v1 - (offset / 2 * (scale - 1));
    return v2;
  }

  setPosX(double x) {
    if (x <= 0) {
      x = 1;
    } else if (state.mapWidth <= x + size) {
      x = state.mapWidth - size - 1;
    }

    final center = state.mapWidth / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetX();

    posX = (((x - center) + (offset / 2 * (scale - 1))) / center / scale * state.mapWidth) + center;
  }

  setPosY(double y) {
    if (y <= 0) {
      y = 1;
    } else if (state.mapHeight <= y + size) {
      y = state.mapHeight - size - 1;
    }

    final center = state.mapHeight / 2;
    final scale = state.getPlayMapScale();
    final offset = state.getPlayMapOffsetY();

    posY = (((y - center) + (offset / 2 * (scale - 1))) / center / scale * state.mapHeight) + center;
  }

  setSize(double size) {
    if (maxSize < size) {
      currentSize = maxSize;
    } else if (size < minSize) {
      currentSize = minSize;
    } else {
      currentSize = size;
    }
  }

  get size => currentSize * state.getPlayMapScale();

  BoxDecoration? isSelected() {
    if (state.getSelectMoveIcon() != this) return null;
    return BoxDecoration(color: const Color(0xFF55FF00), borderRadius: BorderRadius.circular(5));
  }

  Widget widget();
}