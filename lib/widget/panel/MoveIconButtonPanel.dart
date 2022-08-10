// ignore_for_file: file_names, overridden_fields, implementation_imports, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/drawer/DrawerType.dart';
import 'package:r6soperationboard/widget/panel/interface/Panel.dart';
import 'package:unicons/unicons.dart';

import '../button/Button.dart';

class MoveIconButtonPanel extends Panel {
  MoveIconButtonPanel(this.state);

  @override
  final MyStatefulWidgetState state;

  @override
  final double offsetX = 5;
  @override
  final double offsetY = 5;

  _textBox(String text) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white))),
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

  _editValueButtons() => Column(children: [
        _textBox(state.language.main('icon_default_size')),
        offsetBox,
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _RemoveIconSizeButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
          offsetBox,
          _valueIconBox(const Icon(UniconsLine.expand_arrows_alt, color: Colors.white), "[ ${state.defaultMoveIconSize.toInt()} ]"),
          offsetBox,
          _AddIconSizeButton(state, Colors.lightBlueAccent, const Size(50, 50)).button(),
        ])
      ]);

  @override
  widget() => ColoredBox(
      color: Colors.blue.shade100,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _AttackOperatorDrawerOpenButton(state, state.attackTeamColor, const Size(200, 50)).button(),
          customOffsetBox(10),
          _DefenseOperatorDrawerOpenButton(state, state.defenseTeamColor, const Size(200, 50)).button(),
          customOffsetBox(10),
          _PublicGadgetDrawerOpenButton(state, state.defenseTeamColor, const Size(200, 50)).button(),
          customOffsetBox(100),
          _editValueButtons(),
          customOffsetBox(100),
          _IconClearButton(state, Colors.lightBlueAccent, const Size(200, 50)).button(),
          customOffsetBox(10),
          _LanguageButton(state, Colors.blue, const Size(50, 50)).button()
        ]),
      ));
}

///#### Button Classes #####
class _AttackOperatorDrawerOpenButton extends Button {
  _AttackOperatorDrawerOpenButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.openDrawer(DrawerType.attackOperator);
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: state.attackTeamColor),
        child: Text(state.language.main('attack'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      );
}

class _DefenseOperatorDrawerOpenButton extends Button {
  _DefenseOperatorDrawerOpenButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.openDrawer(DrawerType.defenseOperator);
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: state.defenseTeamColor),
        child: Text(state.language.main('defense'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      );
}

class _PublicGadgetDrawerOpenButton extends Button {
  _PublicGadgetDrawerOpenButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.openDrawer(DrawerType.publicGadget);
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: const Color(0xFFE8C515)),
        child: Text(state.language.main('public_gadget'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      );
}

class _AddIconSizeButton extends Button {
  _AddIconSizeButton(this.state, this.color, this.size);

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
            state.addDefaultMoveIconSize(5);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: const Icon(Icons.add),
      );
}

class _RemoveIconSizeButton extends Button {
  _RemoveIconSizeButton(this.state, this.color, this.size);

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
            state.addDefaultMoveIconSize(-5);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: const Icon(Icons.remove),
      );
}

class _IconClearButton extends Button {
  _IconClearButton(this.state, this.color, this.size);

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
            state.clearMoveIcon();
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: Text(state.language.main('icon_clear'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      );
}

class _LanguageButton extends Button {
  _LanguageButton(this.state, this.color, this.size);

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
            state.openDrawer(DrawerType.language);
          });
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: color),
        child: const Icon(Icons.language),
      );
}
