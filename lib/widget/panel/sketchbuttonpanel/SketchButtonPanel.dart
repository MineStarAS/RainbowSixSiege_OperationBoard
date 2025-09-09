// ignore_for_file: file_names, overridden_fields, implementation_imports, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/panel/interface/Panel.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/AddOpacityButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/AddThicknessButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/RemoveOpacityButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/RemoveThicknessButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchButton/SelectArrowSketchButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchButton/SelectCircleSketchButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SelectColorButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchButton/SelectCrossMarkSketchButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchButton/SelectLineSketchButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchButton/SelectSquareBorderSketchButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchButton/SelectSquareSketchButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchClearButton.dart';
import 'package:r6soperationboard/widget/panel/sketchbuttonpanel/SketchUndoButton.dart';
import 'package:unicons/unicons.dart';

///Panel Class
class SketchButtonPanel extends Panel {
  SketchButtonPanel();

  @override
  final double offsetX = 5;
  @override
  final double offsetY = 5;

  Container _textBox(String text) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white))),
    );
  }

  Container _valueIconBox(Icon icon, String text) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: icon),
          Center(child: Text(text, style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }

  Column _selectColorButtons() {
    final colorList = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.white, Colors.grey, Colors.black];

    final widgetList = <Widget>[];

    for (final color in colorList) {
      widgetList.add(SelectColorButton(Colors.lightBlueAccent, color).button());
    }

    return Column(children: [
      _textBox(Static.state.language.main('sketch_color')),
      offsetBox,
      Row(children: [widgetList[0], offsetBox, widgetList[1], offsetBox, widgetList[2]]),
      offsetBox,
      Row(children: [widgetList[3], offsetBox, widgetList[4], offsetBox, widgetList[5]]),
      offsetBox,
      Row(children: [widgetList[6], offsetBox, widgetList[7], offsetBox, widgetList[8]]),
    ]);
  }

  Column _selectSketchButtons() => Column(
        children: [
          _textBox(Static.state.language.main('sketch_mode')),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SelectArrowSketchButton().button(),
            offsetBox,
            SelectSquareSketchButton().button(),
            offsetBox,
            SelectSquareBorderSketchButton().button(),
          ]),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SelectLineSketchButton().button(),
            offsetBox,
            SelectCircleSketchButton().button(),
            offsetBox,
            SelectCrossMarkSketchButton().button(),
          ]),
        ],
      );

  Column _editValueButtons() => Column(
        children: [
          _textBox(Static.state.language.main('sketch_value')),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RemoveThicknessButton(Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _valueIconBox(const Icon(UniconsLine.arrows_resize, color: Colors.white), "[ ${Static.state.getSketchThickness(Static.state.sketchMode).toInt()} ]"),
            offsetBox,
            AddThicknessButton(Colors.lightBlueAccent, const Size(50, 50)).button(),
          ]),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            RemoveOpacityButton(Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _valueIconBox(const Icon(UniconsLine.border_clear, color: Colors.white), "[ ${(Static.state.getSketchOpacity(Static.state.sketchMode) * 10).toInt()} ]"),
            offsetBox,
            AddOpacityButton(Colors.lightBlueAccent, const Size(50, 50)).button(),
          ]),
        ],
      );

  @override
  widget() => ColoredBox(
      color: Colors.blue.shade100,
      child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _selectColorButtons(),
            customOffsetBox(30),
            _selectSketchButtons(),
            customOffsetBox(30),
            _editValueButtons(),
            customOffsetBox(30),
            Column(children: [
              SketchUndoButton(Colors.lightBlueAccent, const Size(180, 50)).button(),
              offsetBox,
              SketchClearButton(Colors.lightBlueAccent, const Size(180, 50)).button(),
            ])
          ])));
}
