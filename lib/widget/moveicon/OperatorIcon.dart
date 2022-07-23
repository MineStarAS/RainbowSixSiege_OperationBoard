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
  OperatorIcon(this.state, this.operator, this.posX, this.posY) {
    state.addMoveIcon(this);
  }

  @override
  MyStatefulWidgetState state;

  @override
  double posX;

  @override
  double posY;

  @override
  final double offsetX = 3;

  @override
  final double offsetY = 3;

  final Operator operator;

  @override
  widget() => GestureDetector(
      onPanUpdate: (details) {
        state.closeOptionPanel();
        state.setState(() {
          setPosX(details.localPosition.dx - (size / 2));
          setPosY(details.localPosition.dy - (size / 2));
        });
      },
      onDoubleTap: () {
        state.setState(() {
          state.setOptionPanel(this);
        });
      },
      child: Container(
        width: size,
        height: size,
        margin: EdgeInsets.only(left: posX, top: posY),
        child: Center(child: SizedBox(height: size, width: size, child: Center(child: Image.asset(operator.path())))),
      ));

  ///Option Panel
  final _buttonColor = Colors.lightBlueAccent;
  final _backGroundColor = Colors.blue.shade100;
  final _gadgetButtonSize = 50.0;

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
    const width = 163;
    const height = 163;

    final double x;
    final double y;

    if (state.mapWidth < posX + width) {
      x = posX - width;
    } else {
      x = posX;
    }

    if (state.mapHeight < posY + height) {
      y = posY - height;
    } else {
      y = posY + maxSize;
    }

    return Container(
        margin: EdgeInsets.only(left: x, top: y),
        child: ColoredBox(
            color: _backGroundColor,
            child: Container(
                height: 163,
                padding: const EdgeInsets.all(3),
                child: Column(children: [
                  Center(
                      child: Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          state.setState(() {
                            if (size > minSize) setSize(size - 5);
                          });
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(58, 50), primary: _buttonColor),
                        child: const Center(child: Icon(Icons.remove))),
                    offset,
                    _valueIconBox(const Icon(UniconsLine.expand_arrows_alt, color: Colors.white, size: 20), size.toInt().toString()),
                    offset,
                    ElevatedButton(
                        onPressed: () {
                          state.setState(() {
                            if (size < maxSize) setSize(size + 5);
                          });
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(58, 50), primary: _buttonColor),
                        child: const Center(child: Icon(Icons.add)))
                  ])),
                  offset,
                  Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          state.setState(() {
                            state.closeOptionPanel();
                            state.removeMoveIcon(this);
                          });
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(85, 50), primary: _buttonColor),
                        child: const Center(child: Icon(Icons.delete_forever, size: 20))),
                    offset,
                    ElevatedButton(
                        onPressed: () {
                          state.setState(() {
                            state.closeOptionPanel();

                            final double x;

                            if (mapWidth < posX + (size * 2)) {
                              x = posX - size;
                            } else {
                              x = posX + size;
                            }

                            state.setState(() {
                              OperatorIcon(state, operator, x, posY);
                            });
                          });
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(85, 50), primary: _buttonColor),
                        child: const Center(child: Icon(Icons.copy, size: 20))),
                  ]),
                  offset,
                  Row(children: [
                    _GadgetButton(state, _buttonColor, const Size(50, 50), x, y, 0, operator).button(),
                    offset,
                    _GadgetButton(state, _buttonColor, const Size(50, 50), x, y, 1, operator).button(),
                    offset,
                    _GadgetButton(state, _buttonColor, const Size(50, 50), x, y, 2, operator).button(),
                  ]),
                ]))));
  }
}

///Button Classes
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
