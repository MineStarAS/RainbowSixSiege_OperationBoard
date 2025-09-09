import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

class SketchClearButton extends Button {
  SketchClearButton(this.color, this.size);

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          Static.state.clearSketch();
        },
        style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
        child: Text(Static.state.language.main('sketch_clear'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      );
}
