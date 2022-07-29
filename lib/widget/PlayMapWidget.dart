// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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

  mapImage() => Center(
        child: SizedBox(
            width: state.mapWidth,
            height: state.mapHeight,
            child: Container(
              margin: EdgeInsets.only(left: state.getPlayMapOffsetX(), top: state.getPlayMapOffsetY()),
              child: Image.asset(
                state.playMap.path(state.floor),
                fit: BoxFit.none,
                scale: state.getPlayMapScale(),
              ),
            )),
      );

  gestureDetector() => Listener(
        onPointerSignal: (event) {
          if (event is! PointerScrollEvent) return;
          state.setState(() {
            if (event.scrollDelta.dy < 0) {
              state.addPlayMapScale(event.localPosition.dx, event.localPosition.dy); //ZoomIn
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
            });
          },
          onDoubleTapCancel: () {
            state.setState(() {
              state.closeOptionPanel();
            });
          },
          child: Center(child: Image.asset("assets/map/BLANK.png")),
        ),
      );
}
