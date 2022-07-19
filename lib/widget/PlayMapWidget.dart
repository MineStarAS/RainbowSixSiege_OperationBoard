// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:r6splannerboard/widget/sketch/Arrow.dart';
import 'package:r6splannerboard/widget/sketch/Circle.dart';
import 'package:r6splannerboard/widget/sketch/CrossMark.dart';
import 'package:r6splannerboard/widget/sketch/Line.dart';
import 'package:r6splannerboard/widget/sketch/SketchMode.dart';
import 'package:r6splannerboard/widget/sketch/Square.dart';
import 'package:r6splannerboard/widget/sketch/SquareBorder.dart';
import 'package:r6splannerboard/widget/sketch/interface/Sketch.dart';

import '../main.dart';

class PlayMapWidget {
  PlayMapWidget(this.state);

  late final MyStatefulWidgetState state;

  mapImage() => Center(child: Image.asset(state.playMap.path(state.floor)));

  gestureDetector() => GestureDetector(
        onTap: () {
          state.setState(() {
            state.closeOptionPanel();
          });
        },
        onPanStart: (details) {
          state.setState(() {
            final Sketch? sketch;
            switch (state.sketchMode) {
              case SketchMode.ARROW:
                sketch = Arrow(state, details.localPosition.dx, details.localPosition.dy);
                break;
              case SketchMode.SQUARE:
                sketch = Square(state, details.localPosition.dx, details.localPosition.dy);
                break;
              case SketchMode.SQUARE_BORDER:
                sketch = SquareBorder(state, details.localPosition.dx, details.localPosition.dy);
                break;
              case SketchMode.LINE:
                sketch = Line(state, details.localPosition.dx, details.localPosition.dy);
                break;
              case SketchMode.CIRCLE:
                sketch = Circle(state, details.localPosition.dx, details.localPosition.dy);
                break;
              case SketchMode.CROSS_MARK:
                sketch = CrossMark(state, details.localPosition.dx, details.localPosition.dy);
                break;

              default:
                return;
            }

            state.addSketch(sketch);
            state.setSketchTarget(sketch);
          });
        },
        onPanUpdate: (details) {
          state.setState(() {
            state.sketchTarget?.setFinishX(details.localPosition.dx);
            state.sketchTarget?.setFinishY(details.localPosition.dy);
          });
        },
        onPanEnd: (details) {
          state.setState(() {
            state.removeSketchTarget();
          });
        },
        child: Center(child: Image.asset("assets/map/BLANK.png")),
      );
}