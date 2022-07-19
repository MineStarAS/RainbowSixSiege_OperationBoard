// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../Main.dart';

abstract class OptionPanel {
  late final MyStatefulWidgetState state;

  late final double offsetX;
  late final double offsetY;

  late final offset = SizedBox(width: offsetX, height: offsetY);

  offsetBox(double offset) => SizedBox(width: offset, height: offset);

  Widget optionPanel();
}
