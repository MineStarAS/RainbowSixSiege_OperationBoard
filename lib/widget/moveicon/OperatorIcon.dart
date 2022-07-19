// ignore_for_file: file_names, no_logic_in_create_state, overridden_fields, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';

import '../../Main.dart';
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
  widget() =>
      GestureDetector(
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
            child: Center(child: SizedBox(height: size, width: size, child: Center(child: Image.asset(operator.path)))),
          ));

  @override
  optionPanel() =>
      Container(
          margin: EdgeInsets.only(left: posX, top: posY + maxSize),
          child: ColoredBox(
              color: Colors.blue.shade100,
              child: Container(
                  width: 122,
                  height: 132,
                  padding: const EdgeInsets.all(3),
                  child: Column(children: [
                    ColoredBox(color: Colors.blue, child: Center(child: Text("크기 : ${size.toInt()}"))),
                    offset,
                    Center(
                        child: Row(children: [
                          ElevatedButton(
                              onPressed: () {
                                state.setState(() {
                                  if (size > minSize) setSize(size - 5);
                                });
                              },
                              style: ElevatedButton.styleFrom(fixedSize: const Size(50, 50), primary: Colors.white),
                              child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ))),
                          offset,
                          ElevatedButton(
                              onPressed: () {
                                state.setState(() {
                                  if (size < maxSize) setSize(size + 5);
                                });
                              },
                              style: ElevatedButton.styleFrom(fixedSize: const Size(50, 50), primary: Colors.white),
                              child: const Center(child: Icon(Icons.add, color: Colors.black)))
                        ])), //[EditSize]
                    offset,
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              state.setState(() {
                                state.closeOptionPanel();
                                state.removeMoveIcon(this);
                              });
                            },
                            style: ElevatedButton.styleFrom(fixedSize: const Size(50, 50), primary: Colors.white),
                            child: const Center(child: Icon(Icons.delete_forever, color: Colors.black))),
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
                            style: ElevatedButton.styleFrom(fixedSize: const Size(50, 50), primary: Colors.white),
                            child: const Center(child: Icon(Icons.copy, color: Colors.black))),
                      ],
                    ), //[Remove]
                  ]))));
}
