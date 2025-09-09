import 'package:flutter/material.dart';

import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';
import 'SketchButton.dart';

class SelectCrossMarkSketchButton extends SketchButton {
  SelectCrossMarkSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.CROSS_MARK;

  @override
  final Icon icon = Icon(Icons.close, color: Colors.white);
}
