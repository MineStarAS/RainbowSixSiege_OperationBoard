// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../main.dart';

abstract class Button {

  late final MyStatefulWidgetState state;

  late final Color color;

  late final Size size;

  disableColor(bool isSelected) {
    if (isSelected) return color.withOpacity(0.4);
    return color;
  }

  Widget button();
}