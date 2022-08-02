// ignore_for_file: file_names, no_logic_in_create_state, overridden_fields, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6splannerboard/data/gadget/Gadget.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';
import 'package:unicons/unicons.dart';

import '../../main.dart';
import '../button/Button.dart';
import 'GadgetIcon.dart';
import 'MoveIcon.dart';

class OperatorIcon extends MoveIcon {
  OperatorIcon(this.state, this.operator, double x, double y) {
    if (x <= 0) {
      x = 1;
    } else if (state.mapWidth <= x + size) {
      x = state.mapWidth - size - 1;
    }

    if (y <= 0) {
      y = 1;
    } else if (state.mapHeight <= y + size) {
      y = state.mapHeight - size - 1;
    }

    final centerX = state.mapWidth / 2;
    final centerY = state.mapHeight / 2;
    final offsetX = state.getPlayMapOffsetX();
    final offsetY = state.getPlayMapOffsetY();
    final scale = state.getPlayMapScale();

    posX = (((x - centerX) + (offsetX / 2 * (scale - 1))) / centerX / scale * state.mapWidth) + centerX;
    posY = (((y - centerY) + (offsetY / 2 * (scale - 1))) / centerY / scale * state.mapHeight) + centerY;

    state.addMoveIcon(this);
    state.setSelectMoveIcon(this);
  }

  OperatorIcon.center(this.state, this.operator) {
    final centerX = state.mapWidth / 2;
    final centerY = state.mapHeight / 2;
    final offsetX = state.getPlayMapOffsetX();
    final offsetY = state.getPlayMapOffsetY();
    final scale = state.getPlayMapScale();

    var x = state.mapWidth / 2;
    var y = state.mapHeight / 2;

    posX = (((x - centerX) + (offsetX / 2 * (scale - 1))) / centerX / scale * state.mapWidth) + centerX;
    posY = (((y - centerY) + (offsetY / 2 * (scale - 1))) / centerY / scale * state.mapHeight) + centerY;

    state.addMoveIcon(this);
    state.setSelectMoveIcon(this);
  }

  OperatorIcon.clone(this.state, OperatorIcon operatorIcon, double x, double y) {
    if (x <= 0) {
      x = 1;
    } else if (state.mapWidth <= x + size) {
      x = state.mapWidth - size - 1;
    }

    if (y <= 0) {
      y = 1;
    } else if (state.mapHeight <= y + size) {
      y = state.mapHeight - size - 1;
    }

    final centerX = state.mapWidth / 2;
    final centerY = state.mapHeight / 2;
    final offsetX = state.getPlayMapOffsetX();
    final offsetY = state.getPlayMapOffsetY();
    final scale = state.getPlayMapScale();

    posX = (((x - centerX) + (offsetX / 2 * (scale - 1))) / centerX / scale * state.mapWidth) + centerX;
    posY = (((y - centerY) + (offsetY / 2 * (scale - 1))) / centerY / scale * state.mapHeight) + centerY;

    operator = operatorIcon.operator;
    currentSize = operatorIcon.currentSize;

    state.addMoveIcon(this);
    state.setSelectMoveIcon(this);
  }

  @override
  MyStatefulWidgetState state;

  @override
  late double posX;
  @override
  late double posY;

  @override
  final double optionPanelOffsetX = 3;
  @override
  final double optionPanelOffsetY = 3;

  late final Operator operator;

  @override
  widget() => GestureDetector(
      onTap: () {
        state.setState(() {
          state.setSelectMoveIcon(this);
        });
      },
      onPanUpdate: (event) {
        state.setSelectMoveIcon(this);
        state.closeOptionPanel();
        state.setState(() {
          setPosX(event.localPosition.dx - (size / 2));
          setPosY(event.localPosition.dy - (size / 2));
        });
      },
      onDoubleTap: () {
        state.setState(() {
          state.setSelectMoveIcon(this);
          state.setOptionPanel(this);
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration: isSelected(),
        margin: EdgeInsets.only(left: getPosX(), top: getPosY()),
        child: Center(child: SizedBox(height: size, width: size, child: Center(child: Image.asset(operator.path())))),
      ));

  ///##### Option Panel #####
  final _buttonColor = Colors.lightBlueAccent;
  final _backGroundColor = Colors.blue.shade100;

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

  @override
  optionPanel() {
    const double width = 180;
    const double height = 163;

    final posX = getPosX();
    final posY = getPosY();

    final double x;
    final double y;

    if (state.mapWidth < posX + width) {
      x = posX - width;
    } else {
      x = posX;
    }

    if (state.mapHeight < posY + height + maxSize * state.getPlayMapScale()) {
      y = posY - height;
    } else {
      y = posY + maxSize * state.getPlayMapScale();
    }

    return Container(
        margin: EdgeInsets.only(left: x, top: y),
        child: ColoredBox(
            color: _backGroundColor,
            child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(3),
                child: Column(children: [
                  Center(
                      child: Row(children: [
                    _SizeRemoveButton(state, _buttonColor, const Size(58, 50), this).button(),
                    offsetBox,
                    _valueIconBox(const Icon(UniconsLine.expand_arrows_alt, color: Colors.white, size: 20), currentSize.toInt().toString()),
                    offsetBox,
                    _SizeAddButton(state, _buttonColor, const Size(58, 50), this).button(),
                  ])),
                  offsetBox,
                  Row(children: [
                    _DeleteIconButton(state, _buttonColor, const Size(85, 50), this).button(),
                    offsetBox,
                    _CloneIconButton(state, _buttonColor, const Size(85, 50), this, x, y).button(),
                  ]),
                  offsetBox,
                  Row(children: [
                    _GadgetButton(state, _buttonColor, const Size(50, 50), x, y, 0, operator).button(),
                    offsetBox,
                    _GadgetButton(state, _buttonColor, const Size(50, 50), x, y, 1, operator).button(),
                    offsetBox,
                    _GadgetButton(state, _buttonColor, const Size(50, 50), x, y, 2, operator).button(),
                  ]),
                ]))));
  }
}

///##### Button Classes #####
class _SizeAddButton extends Button {
  _SizeAddButton(this.state, this.color, this.size, this.operatorIcon);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final OperatorIcon operatorIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          operatorIcon.setSize(operatorIcon.currentSize + 5);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
      child: const Icon(Icons.add),
    );
  }
}

class _SizeRemoveButton extends Button {
  _SizeRemoveButton(this.state, this.color, this.size, this.operatorIcon);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final OperatorIcon operatorIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          operatorIcon.setSize(operatorIcon.currentSize - 5);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
      child: const Icon(Icons.remove),
    );
  }
}

class _DeleteIconButton extends Button {
  _DeleteIconButton(this.state, this.color, this.size, this.operatorIcon);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final OperatorIcon operatorIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          state.closeOptionPanel();
          state.removeMoveIcon(operatorIcon);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
      child: const Center(child: Icon(Icons.delete_forever, size: 20)),
    );
  }
}

class _CloneIconButton extends Button {
  _CloneIconButton(this.state, this.color, this.size, this.operatorIcon, this.x, this.y);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final OperatorIcon operatorIcon;

  double x;
  double y;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          state.closeOptionPanel();
          OperatorIcon.clone(state, operatorIcon, x, y);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
      child: const Center(child: Icon(Icons.copy, size: 20)),
    );
  }
}

class _GadgetButton extends Button {
  _GadgetButton(this.state, this.color, this.size, this.x, this.y, this.gadgetNumber, this.operator);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final double x;
  final double y;

  final int gadgetNumber;

  final Operator operator;

  Gadget? gadget() {
    if (gadgetNumber >= operator.gadgets.length) return null;
    return operator.gadgets[gadgetNumber];
  }

  @override
  button() {
    Widget child;
    if (gadget() == null) {
      child = const Icon(UniconsLine.times_circle);
    } else {
      child = Image.asset(gadget()!.path());
    }
    return ElevatedButton(
      onPressed: () {
        if (gadget() == null) return;
        state.setState(() {
          state.closeOptionPanel();
          GadgetIcon(state, gadget()!, x, y);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, primary: disableColor(gadgetNumber >= operator.gadgets.length)),
      child: child,
    );
  }
}
