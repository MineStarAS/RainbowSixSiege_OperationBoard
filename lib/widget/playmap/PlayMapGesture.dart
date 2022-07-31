// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:r6splannerboard/main.dart';
import 'package:r6splannerboard/widget/sketch/Arrow.dart';
import 'package:r6splannerboard/widget/sketch/Circle.dart';
import 'package:r6splannerboard/widget/sketch/CrossMark.dart';
import 'package:r6splannerboard/widget/sketch/Line.dart';
import 'package:r6splannerboard/widget/sketch/SketchMode.dart';
import 'package:r6splannerboard/widget/sketch/Square.dart';
import 'package:r6splannerboard/widget/sketch/SquareBorder.dart';
import 'package:r6splannerboard/widget/sketch/interface/Sketch.dart';

class PlayMapGesture {
  PlayMapGesture(this.state);

  late final MyStatefulWidgetState state;

  double? _originX;
  double? _originY;

  widget() => Listener(
        ///Mouse Wheel Scroll
        onPointerSignal: (event) {
          if (event is! PointerScrollEvent) return;
          state.setState(() {
            state.closeOptionPanel();
            if (event.scrollDelta.dy < 0) {
              state.addPlayMapScale(); //ZoomIn
            } else {
              state.removePlayMapScale(); //ZoomOut
            }
          });
        },
        child: GestureDetector(
          onTap: () {
            state.setState(() {
              state.closeOptionPanel();
            });
          },
          onPanStart: (event) {
            if (state.moveImageBoolean) {
              _originX = event.localPosition.dx;
              _originY = event.localPosition.dy;
              return;
            }
            state.setState(() {
              final Sketch? sketch;
              switch (state.sketchMode) {
                case SketchMode.ARROW:
                  sketch = Arrow(state, event.localPosition.dx, event.localPosition.dy);
                  break;
                case SketchMode.SQUARE:
                  sketch = Square(state, event.localPosition.dx, event.localPosition.dy);
                  break;
                case SketchMode.SQUARE_BORDER:
                  sketch = SquareBorder(state, event.localPosition.dx, event.localPosition.dy);
                  break;
                case SketchMode.LINE:
                  sketch = Line(state, event.localPosition.dx, event.localPosition.dy);
                  break;
                case SketchMode.CIRCLE:
                  sketch = Circle(state, event.localPosition.dx, event.localPosition.dy);
                  break;
                case SketchMode.CROSS_MARK:
                  sketch = CrossMark(state, event.localPosition.dx, event.localPosition.dy);
                  break;

                default:
                  return;
              }

              state.addSketch(sketch);
              state.setSketchTarget(sketch);
            });
          },
          onPanUpdate: (event) {
            ///Move PlayMap Image
            if (state.moveImageBoolean) {
              state.setState(() {
                final scale = 1.0 + state.zoomInLimit - state.getPlayMapScale();

                if (_originX != null) state.addPlayMapOffsetX((_originX! - event.localPosition.dx) * scale);
                if (_originY != null) state.addPlayMapOffsetY((_originY! - event.localPosition.dy) * scale);

                _originX = event.localPosition.dx;
                _originY = event.localPosition.dy;
              });
              return;
            }

            ///Draw Sketch
            state.setState(() {
              state.sketchTarget?.setFinishX(event.localPosition.dx);
              state.sketchTarget?.setFinishY(event.localPosition.dy);
            });
          },
          onPanEnd: (event) {
            state.setState(() {
              state.closeOptionPanel();
              state.removeSketchTarget();
              state.moveImageBoolean = false;
            });
          },
          onDoubleTap: () {
            state.setState(() {
              state.closeOptionPanel();
            });
          },
          onDoubleTapCancel: () {
            state.setState(() {
              state.closeOptionPanel();
              state.moveImageBoolean = true;
            });
          },
          child: Center(child: Image.asset("assets/map/BLANK.png")),
        ),
      );
}
