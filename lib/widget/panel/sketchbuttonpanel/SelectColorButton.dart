import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

class SelectColorButton extends Button {
  SelectColorButton(this.color, this.sketchColor);

  @override
  final Color color;

  @override
  final Size size = Size(50, 50);

  final Color sketchColor;

  @override
  Widget button() => ElevatedButton(
    onPressed: () {
      Static.state.setState(() {
        Static.state.sketchColor = sketchColor;
      });
    },
    style: buttonStyleBackgroundColor(disableColor(Static.state.sketchColor == sketchColor)),
    child: Icon(Icons.square, color: sketchColor),
  );
}