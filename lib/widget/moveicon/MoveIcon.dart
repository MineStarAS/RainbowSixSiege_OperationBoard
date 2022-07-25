// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r6splannerboard/widget/panel/interface/OptionPanel.dart';

import '../../main.dart';

abstract class MoveIcon extends OptionPanel {

  late double posX;
  late double posY;

  late final double minSize;
  late final double maxSize;
  late double currentSize;

  late final double mapWidth = state.mapWidth;
  late final double mapHeight =  state.mapHeight;

  setPosX(double x) {
    if (x < 0) {
      posX = 0;
    } else if (mapWidth < x + currentSize) {
      posX = mapWidth - currentSize;
    } else {
      posX = x;
    }
  }

  setPosY(double y) {
    if (y < 0) {
      posY = 0;
    } else if (mapHeight < y + currentSize) {
      posY = mapHeight - currentSize;
    } else {
      posY = y;
    }
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
  get size => currentSize;

  Widget widget();
}
