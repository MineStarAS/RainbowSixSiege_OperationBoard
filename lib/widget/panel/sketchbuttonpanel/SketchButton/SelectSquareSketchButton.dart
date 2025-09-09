import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';
import 'SketchButton.dart';

class SelectSquareSketchButton extends SketchButton {
  SelectSquareSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.SQUARE;

  @override
  final Icon icon = Icon(Icons.square, color: Colors.white);
}