import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';
import 'SketchButton.dart';

class SelectSquareBorderSketchButton extends SketchButton {
  SelectSquareBorderSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.SQUARE_BORDER;

  @override
  final Icon icon = Icon(Icons.square_outlined, color: Colors.white);

}
