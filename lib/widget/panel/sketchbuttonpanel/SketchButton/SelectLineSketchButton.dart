import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';
import 'SketchButton.dart';

class SelectLineSketchButton extends SketchButton {
  SelectLineSketchButton();

  @override
  final SketchMode sketchMode = SketchMode.LINE;

  @override
  final Icon icon = Icon(UniconsLine.line_alt, color: Colors.white);
}