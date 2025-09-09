import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../button/Button.dart';
import '../../../sketch/SketchMode.dart';

class SketchButton extends Button {
  SketchButton();

  @override
  final Color color = Colors.lightBlueAccent;

  @override
  final Size size = Size(50, 50);

  late final SketchMode sketchMode;
  late final Icon icon;

  @override
  Widget button() => ElevatedButton(
        onPressed: () {
          Static.state.setState(() {
            Static.state.sketchMode = sketchMode;
          });
        },
        style: buttonStyleBackgroundColor(disableColor(Static.state.sketchMode == sketchMode)),
        child: icon,
      );
}
