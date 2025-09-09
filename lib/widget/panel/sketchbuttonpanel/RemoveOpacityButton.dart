import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

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
    style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
    child: const Icon(Icons.remove),
  );
}