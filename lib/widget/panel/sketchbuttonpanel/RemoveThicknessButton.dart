import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../sketch/SketchMode.dart';

class RemoveThicknessButton extends Button {
  RemoveThicknessButton( this.color, this.size);

  @override
  final Color color;

  @override
  final Size size;

  @override
  Widget button() => ElevatedButton(
    onPressed: () {
      Static.state.setState(() {
        Static.state.removeSketchThickness(Static.state.sketchMode);
      });
    },
    style: ElevatedButton.styleFrom(
        fixedSize: size,
        backgroundColor: disableColor(Static.state.sketchMode == SketchMode.SQUARE)),
    child: const Icon(Icons.remove),
  );
}