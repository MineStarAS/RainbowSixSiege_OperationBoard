import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';

class SelectSquareBorderSketchButton extends Button {
  SelectSquareBorderSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.SQUARE_BORDER;

  @override
  final Icon icon = Icon(Icons.square_outlined, color: Colors.white);

}
