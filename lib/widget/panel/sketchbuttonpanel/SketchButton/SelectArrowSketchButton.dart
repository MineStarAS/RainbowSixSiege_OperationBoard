import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';
import 'SketchButton.dart';

class SelectArrowSketchButton extends SketchButton {
  SelectArrowSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.ARROW;

  @override
  final Icon icon = Icon(UniconsSolid.arrow_up_right, color: Colors.white);
}
