// ignore_for_file: file_names, overridden_fields, implementation_imports, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/panel/interface/Panel.dart';
import 'package:r6soperationboard/widget/sketch/SketchMode.dart';
import 'package:unicons/unicons.dart';

import '../button/Button.dart';

///Panel Class
class SketchButtonPanel extends Panel {
  SketchButtonPanel(this.state);

  @override
  final MyStatefulWidgetState state;

  @override
  final double offsetX = 5;
  @override
  final double offsetY = 5;

  _textBox(String text) {
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

  _iconBox(Icon icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: icon),
    );
  }

  _valueIconBox(Icon icon, String text) {
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

  _selectColorButtons() {
    final colorList = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.white, Colors.grey, Colors.black];

    final widgetList = <Widget>[];

    for (final color in colorList) {
      widgetList.add(_SelectColorButton(state, Colors.lightBlueAccent, const Size(50, 50), color).button());
    }

    return Column(children: [
      _textBox(state.language.main('sketch_color')),
      offsetBox,
      Row(children: [widgetList[0], offsetBox, widgetList[1], offsetBox, widgetList[2]]),
      offsetBox,
      Row(children: [widgetList[3], offsetBox, widgetList[4], offsetBox, widgetList[5]]),
      offsetBox,
      Row(children: [widgetList[6], offsetBox, widgetList[7], offsetBox, widgetList[8]]),
    ]);
  }

  _selectSketchButtons() => Column(
        children: [
          _textBox(state.language.main('sketch_mode')),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _SelectArrowSketchButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _SelectSquareSketchButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _SelectSquareBorderSketchButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
          ]),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _SelectLineSketchButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _SelectCircleSketchButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _SelectCrossMarkSketchButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
          ]),
        ],
      );

  _editValueButtons() => Column(
        children: [
          _textBox(state.language.main('sketch_value')),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _RemoveThicknessButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _valueIconBox(const Icon(UniconsLine.arrows_resize, color: Colors.white), "[ ${state.getSketchThickness(state.sketchMode).toInt()} ]"),
            offsetBox,
            _AddThicknessButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
          ]),
          offsetBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _RemoveOpacityButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
            offsetBox,
            _valueIconBox(const Icon(UniconsLine.border_clear, color: Colors.white), "[ ${(state.getSketchOpacity(state.sketchMode) * 10).toInt()} ]"),
            offsetBox,
            _AddOpacityButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
          ]),
        ],
      );

  @override
  widget() => ColoredBox(
      color: Colors.blue.shade100,
      child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
            _selectColorButtons(),
            customOffsetBox(30),
            _selectSketchButtons(),
            customOffsetBox(30),
            _editValueButtons(),
            customOffsetBox(30),
            Column(children: [
              _SketchUndoButton(state, Colors.lightBlueAccent, const Size(180, 50)).button(),
              offsetBox,
              _SketchClearButton(state, Colors.lightBlueAccent, const Size(180, 50)).button(),
            ])
          ])));
}

///Button Classes
class _SelectColorButton extends Button {
  _SelectColorButton(this.state, this.color, this.size, this.sketchColor);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final Color sketchColor;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchColor = sketchColor;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchColor == sketchColor)),
        child: Icon(Icons.square, color: sketchColor),
      );
}

class _SelectArrowSketchButton extends Button {
  _SelectArrowSketchButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchMode = SketchMode.ARROW;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.ARROW)),
        child: const Icon(UniconsSolid.arrow_up_right),
      );
}

class _SelectSquareSketchButton extends Button {
  _SelectSquareSketchButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchMode = SketchMode.SQUARE;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.SQUARE)),
        child: const Icon(Icons.square),
      );
}

class _SelectSquareBorderSketchButton extends Button {
  _SelectSquareBorderSketchButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchMode = SketchMode.SQUARE_BORDER;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.SQUARE_BORDER)),
        child: const Icon(Icons.square_outlined),
      );
}

class _SelectLineSketchButton extends Button {
  _SelectLineSketchButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchMode = SketchMode.LINE;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.LINE)),
        child: const Icon(UniconsLine.line_alt),
      );
}

class _SelectCircleSketchButton extends Button {
  _SelectCircleSketchButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchMode = SketchMode.CIRCLE;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.CIRCLE)),
        child: const Icon(Icons.circle_outlined),
      );
}

class _SelectCrossMarkSketchButton extends Button {
  _SelectCrossMarkSketchButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.sketchMode = SketchMode.CROSS_MARK;
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.CROSS_MARK)),
        child: const Icon(Icons.close),
      );
}

class _AddThicknessButton extends Button {
  _AddThicknessButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.addSketchThickness(state.sketchMode);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.SQUARE)),
        child: const Icon(Icons.add),
      );
}

class _RemoveThicknessButton extends Button {
  _RemoveThicknessButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.removeSketchThickness(state.sketchMode);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(state.sketchMode == SketchMode.SQUARE)),
        child: const Icon(Icons.remove),
      );
}

class _AddOpacityButton extends Button {
  _AddOpacityButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.addSketchOpacity(state.sketchMode);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: const Icon(Icons.add),
      );
}

class _RemoveOpacityButton extends Button {
  _RemoveOpacityButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.removeSketchOpacity(state.sketchMode);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: const Icon(Icons.remove),
      );
}

class _SketchUndoButton extends Button {
  _SketchUndoButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.undoSketch();
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: Text(state.language.main('sketch_undo'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      );
}

class _SketchClearButton extends Button {
  _SketchClearButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.clearSketch();
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: Text(state.language.main('sketch_clear'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      );
}
