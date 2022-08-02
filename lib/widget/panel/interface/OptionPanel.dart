// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../main.dart';

abstract class OptionPanel {
  late final MyStatefulWidgetState state;

  late final double optionPanelOffsetX;
  late final double optionPanelOffsetY;

  late final offsetBox = SizedBox(width: optionPanelOffsetX, height: optionPanelOffsetY);

  customOffsetBox(double offset) => SizedBox(width: offset, height: offset);

  Widget optionPanel();
}
