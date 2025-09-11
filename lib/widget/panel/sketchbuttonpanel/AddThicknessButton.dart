import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../sketch/SketchMode.dart';

class AddThicknessButton extends Button {
  AddThicknessButton(this.color, this.size);

  @override
  final Color color;

  @override
  final Size size;

  @override
  Widget button() =>
      ElevatedButton(
          onPressed: () {
            Static.state.setState(() {
              Static.state.addSketchThickness(Static.state.sketchMode);
            });
          },
          style: buttonStyleBackgroundColor(disableColor(Static.state.sketchMode == SketchMode.SQUARE)),
          child: const Icon(Icons.add, color: Colors.white)

  ,

  );
}