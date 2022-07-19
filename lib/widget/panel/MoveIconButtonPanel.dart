// ignore_for_file: file_names, overridden_fields, implementation_imports

import 'package:flutter/material.dart';
import 'package:r6splannerboard/main.dart';
import 'package:r6splannerboard/widget/panel/interface/Panel.dart';

import '../button/Button.dart';

class MoveIconButtonPanel extends Panel {
  MoveIconButtonPanel(this.state);

  @override
  final MyStatefulWidgetState state;

  @override
  final double offsetX = 5;
  @override
  final double offsetY = 10;

  @override
  widget() => ColoredBox(
          color: Colors.blue.shade100,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(children: [
            AttackOperatorDrawerOpenButton(state, state.attackTeamColor, const Size(200, 50)).button(),
            SizedBox(height: offsetY),
            DefenseOperatorDrawerOpenButton(state, state.defenseTeamColor, const Size(200, 50)).button(),
          ]),
        ),
  );
}

class AttackOperatorDrawerOpenButton extends Button {
  AttackOperatorDrawerOpenButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.openAttackOpDrawer();
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: state.attackTeamColor),
        child: const Text("공격팀 오퍼레이터", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      );
}

class DefenseOperatorDrawerOpenButton extends Button {
  DefenseOperatorDrawerOpenButton(this.state, this.color, this.size);

  @override
  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.openDefenseOpDrawer();
        },
        style: ElevatedButton.styleFrom(fixedSize: size, primary: state.defenseTeamColor),
        child: const Text("방어팀 오퍼레이터", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      );
}
