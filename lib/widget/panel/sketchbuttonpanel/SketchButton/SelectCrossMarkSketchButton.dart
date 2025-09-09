import 'package:flutter/material.dart';

import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';

class SelectCrossMarkSketchButton extends Button {
  SelectCrossMarkSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.CROSS_MARK;

  @override
  final Icon icon = Icon(Icons.close, color: Colors.white);
}
