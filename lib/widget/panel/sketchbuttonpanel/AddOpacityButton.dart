import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

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
    style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
    child: const Icon(Icons.add),
  );
}