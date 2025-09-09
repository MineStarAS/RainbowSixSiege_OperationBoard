// ignore_for_file: file_names, no_logic_in_create_state, overridden_fields, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6soperationboard/data/gadget/Gadget.dart';
import 'package:unicons/unicons.dart';

import '../../main.dart';
import '../button/Button.dart';
import 'MoveIcon.dart';

class GadgetIcon extends MoveIcon {
  GadgetIcon(this.state, this.gadget, double x, double y) {
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

  GadgetIcon.center(this.state, this.gadget) {
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

  GadgetIcon.clone(this.state, GadgetIcon gadgetIcon, double x, double y) {
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

    gadget = gadgetIcon.gadget;
    currentSize = gadgetIcon.currentSize;
    rotate = gadgetIcon.rotate;

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

  double rotate = 0;

  bool isOtherImage = false;

  late final Gadget gadget;

  _path() {
    if (!isOtherImage) return gadget.path();
    if (gadget.hasOtherImage == GadgetOtherImage.Null) return gadget.path();
    return gadget.otherPath();
  }

  @override
  clone() {
    final double width = size;
    final double height = size;

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
    GadgetIcon.clone(state, this, x, y);
  }

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
      onLongPress: () {
        state.setState(() {
          isOtherImage = !isOtherImage;
        });
      },
      child: Container(
          width: size,
          height: size,
          decoration: isSelected(),
          margin: EdgeInsets.only(left: getPosX(), top: getPosY()),
          child: Center(
              child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..rotateZ(rotate * 3.1415927 / 180),
            child: SizedBox(height: size, width: size, child: Center(child: Image.asset(_path()))),
          ))));

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
                    _RotateRemoveButton(state, _buttonColor, const Size(58, 50), this).button(),
                    offsetBox,
                    _valueIconBox(const Icon(Icons.screen_rotation_alt, color: Colors.white, size: 20), rotate.toInt().toString()),
                    offsetBox,
                    _RotateAddButton(state, _buttonColor, const Size(58, 50), this).button(),
                  ]),
                ]))));
  }
}

///##### Button Classes #####
class _SizeAddButton extends Button {
  _SizeAddButton(this.state, this.color, this.size, this.gadgetIcon);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final GadgetIcon gadgetIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        if (gadgetIcon.currentSize >= gadgetIcon.minSize) {
          state.setState(() {
            gadgetIcon.setSize(gadgetIcon.currentSize + 5);
          });
        }
      },
      style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
      child: const Icon(Icons.add),
    );
  }
}

class _SizeRemoveButton extends Button {
  _SizeRemoveButton(this.state, this.color, this.size, this.gadgetIcon);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final GadgetIcon gadgetIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        if (gadgetIcon.currentSize > gadgetIcon.minSize) {
          state.setState(() {
            gadgetIcon.setSize(gadgetIcon.currentSize - 5);
          });
        }
      },
      style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color, padding: EdgeInsets.zero),
      child: const Icon(Icons.remove),
    );
  }
}

class _DeleteIconButton extends Button {
  _DeleteIconButton(this.state, this.color, this.size, this.gadgetIcon);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final GadgetIcon gadgetIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          state.closeOptionPanel();
          state.removeMoveIcon(gadgetIcon);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
      child: const Center(child: Icon(Icons.delete_forever, size: 20)),
    );
  }
}

class _CloneIconButton extends Button {
  _CloneIconButton(this.state, this.color, this.size, this.gadgetIcon, this.x, this.y);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final GadgetIcon gadgetIcon;

  double x;
  double y;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          state.closeOptionPanel();
          GadgetIcon.clone(state, gadgetIcon, x, y);
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
      child: const Center(child: Icon(Icons.copy, size: 20)),
    );
  }
}

class _RotateAddButton extends Button {
  _RotateAddButton(this.state, this.color, this.size, this.gadgetIcon);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;
  final GadgetIcon gadgetIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          gadgetIcon.rotate += gadgetIcon.gadget.angleStep;
          if (gadgetIcon.rotate >= 360) gadgetIcon.rotate = gadgetIcon.rotate % 360;
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
      child: const Icon(Icons.rotate_right),
    );
  }
}

class _RotateRemoveButton extends Button {
  _RotateRemoveButton(this.state, this.color, this.size, this.gadgetIcon);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  final GadgetIcon gadgetIcon;

  @override
  button() {
    return ElevatedButton(
      onPressed: () {
        state.setState(() {
          gadgetIcon.rotate -= gadgetIcon.gadget.angleStep;
          if (gadgetIcon.rotate < 0) gadgetIcon.rotate = gadgetIcon.rotate % -360;
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
      child: const Icon(Icons.rotate_left),
    );
  }
}
