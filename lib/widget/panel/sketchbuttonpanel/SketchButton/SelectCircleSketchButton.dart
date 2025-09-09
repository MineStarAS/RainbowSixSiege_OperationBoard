import 'package:flutter/material.dart';

import '../../../sketch/SketchMode.dart';
import 'SketchButton.dart';

class SelectCircleSketchButton extends SketchButton {
  SelectCircleSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.CIRCLE;

  @override
  final Icon icon = Icon(Icons.circle_outlined, color: Colors.white);
}
