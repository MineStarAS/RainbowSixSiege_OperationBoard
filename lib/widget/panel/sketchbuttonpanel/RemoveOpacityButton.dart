import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../sketch/SketchMode.dart';

class RemoveOpacityButton extends Button {
  RemoveOpacityButton(this.color, this.size);

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
    onPressed: () {
      Static.state.setState(() {
        Static.state.removeSketchOpacity(Static.state.sketchMode);
      });
    },
    style: buttonStyleBackgroundColor(disableColor(Static.state.sketchMode == SketchMode.NONE)),
    child: const Icon(Icons.remove, color: Colors.white),
  );
}