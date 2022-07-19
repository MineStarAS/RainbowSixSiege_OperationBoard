// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r6splannerboard/widget/panel/interface/OptionPanel.dart';

import '../../main.dart';

abstract class MoveIcon extends OptionPanel {
  late final MyStatefulWidgetState state;

  late double posX;
  late double posY;

  final double minSize = 20.0;
  final double maxSize = 50.0;
  double _currentSize = 30.0;

  late final double mapWidth = state.mapWidth;
  late final double mapHeight =  state.mapHeight;

  setPosX(double x) {
    if (x < 0) {
      posX = 0;
    } else if (mapWidth < x + _currentSize) {
      posX = mapWidth - _currentSize;
    } else {
      posX = x;
    }
  }

  setPosY(double y) {
    if (y < 0) {
      posY = 0;
    } else if (mapHeight < y + _currentSize) {
      posY = mapHeight - _currentSize;
    } else {
      posY = y;
    }
  }

  setSize(double size) {
    if (maxSize < size) {
      _currentSize = maxSize;
    } else if (size < minSize) {
      _currentSize = minSize;
    } else {
      _currentSize = size;
    }
  }
  get size => _currentSize;

  Widget widget();
}
