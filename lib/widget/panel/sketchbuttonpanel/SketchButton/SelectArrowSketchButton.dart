import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';

class SelectArrowSketchButton extends Button {
  SelectArrowSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.CIRCLE;

  @override
  final Icon icon = Icon(UniconsSolid.arrow_up_right, color: Colors.white);
}
