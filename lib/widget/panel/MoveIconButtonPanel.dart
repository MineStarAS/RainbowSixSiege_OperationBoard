// ignore_for_file: file_names, overridden_fields, implementation_imports, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';
import 'package:r6soperationboard/widget/drawer/DrawerType.dart';
import 'package:r6soperationboard/widget/panel/interface/Panel.dart';
import 'package:unicons/unicons.dart';

import '../button/Button.dart';
import 'moveiconbuttonpanel/AddIconSizeButton.dart';
import 'moveiconbuttonpanel/AttackOperatorDrawerOpenButton.dart';
import 'moveiconbuttonpanel/DefenseOperatorDrawerOpenButton.dart';
import 'moveiconbuttonpanel/IconClearButton.dart';
import 'moveiconbuttonpanel/LanguageButton.dart';
import 'moveiconbuttonpanel/PublicGadgetDrawerOpenButton.dart';
import 'moveiconbuttonpanel/RemoveIconSizeButton.dart';

class MoveIconButtonPanel extends Panel {
  MoveIconButtonPanel();

  @override
  final double offsetX = 5;
  @override
  final double offsetY = 5;

  Container _titleBox(String text) {
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

  Column _editValueButtons() => Column(children: [
        _titleBox(Static.state.language.main('icon_default_size')),
        offsetBox,
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RemoveIconSizeButton(Static.state, Colors.lightBlueAccent, const Size(50, 50)).button(),
          offsetBox,
          _valueIconBox(const Icon(UniconsLine.expand_arrows_alt, color: Colors.white), "[ ${Static.state.defaultMoveIconSize.toInt()} ]"),
          offsetBox,
          AddIconSizeButton(Static.state, Colors.lightBlueAccent, const Size(50, 50)).button(),
        ])
      ]);

  @override
  widget() => ColoredBox(
      color: Colors.blue.shade100,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AttackOperatorDrawerOpenButton(Static.state, Static.attackTeamColor, const Size(200, 50)).button(),
          customOffsetBox(10),
          DefenseOperatorDrawerOpenButton(Static.state, Static.defenseTeamColor, const Size(200, 50)).button(),
          customOffsetBox(10),
          PublicGadgetDrawerOpenButton(Static.state, Static.publicColor, const Size(200, 50)).button(),
          customOffsetBox(100),
          _editValueButtons(),
          customOffsetBox(100),
          IconClearButton(Static.state, Colors.lightBlueAccent, const Size(200, 50)).button(),
          customOffsetBox(10),
          LanguageButton(Static.state, Colors.blue, const Size(50, 50)).button()
        ]),
      ));
}