import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../sketch/SketchMode.dart';

class AddOpacityButton extends Button {
  AddOpacityButton(this.color, this.size);

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
    onPressed: () {
      Static.state.setState(() {
        Static.state.addSketchOpacity(Static.state.sketchMode);
      });
    },
    style: buttonStyleBackgroundColor(disableColor(Static.state.sketchMode == SketchMode.NONE)),
    child: const Icon(Icons.add, color: Colors.white),
  );
}