// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/sketch/Arrow.dart';
import 'package:r6soperationboard/widget/sketch/Circle.dart';
import 'package:r6soperationboard/widget/sketch/CrossMark.dart';
import 'package:r6soperationboard/widget/sketch/Line.dart';
import 'package:r6soperationboard/widget/sketch/SketchMode.dart';
import 'package:r6soperationboard/widget/sketch/Square.dart';
import 'package:r6soperationboard/widget/sketch/SquareBorder.dart';
import 'package:r6soperationboard/widget/sketch/interface/Sketch.dart';

class PlayMapGesture {
  PlayMapGesture(this.state);

  late final MyStatefulWidgetState state;

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
            state.debug("${state.getPlayMapOffsetX()}, ${state.getPlayMapOffsetY()}, ${state.getPlayMapScale()}");
          });
        },
        child: GestureDetector(
          onTap: () {
            state.setState(() {
              state.closeOptionPanel();
              state.setSelectMoveIcon(null);
            });
          },
          onPanStart: (event) {
            state.setSelectMoveIcon(null);
            if (state.sketchMode == SketchMode.NONE) {
              return;
            }
            state.setState(() {
              final Sketch? sketch;
              switch (state.sketchMode) {
                case SketchMode.NONE:
                  return;

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
            if (state.sketchMode == SketchMode.NONE) {
              state.setState(() {
                double x = event.delta.dx * 5 * state.getPlayMapScale();
                double y = event.delta.dy * 5 * state.getPlayMapScale();
                state.debug("${state.getPlayMapOffsetX()}, ${state.getPlayMapOffsetY()}, ${state.getPlayMapScale()}");
                state.addPlayMapOffsetX(x);
                state.addPlayMapOffsetY(y);
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
            });
          },
          onDoubleTap: () {
            state.setState(() {
              state.closeOptionPanel();
              state.setSelectMoveIcon(null);
            });
          },
          onDoubleTapCancel: () {
            state.setState(() {
              state.closeOptionPanel();
              state.setSelectMoveIcon(null);
            });
          },
          child: Center(child: SizedBox(width: 9999, height: 9999, child: ColoredBox(color: Colors.transparent))),
        ),
      );
}
