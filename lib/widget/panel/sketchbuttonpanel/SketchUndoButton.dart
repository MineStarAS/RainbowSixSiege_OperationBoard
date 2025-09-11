import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

class SketchUndoButton extends Button {
  SketchUndoButton(this.color, this.size);

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          Static.state.undoSketch();
        },
        style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
        child: Text(Static.state.language.main('sketch_undo'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
      );
}
