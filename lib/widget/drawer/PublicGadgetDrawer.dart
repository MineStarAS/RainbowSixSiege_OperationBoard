// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6soperationboard/data/gadget/Gadget.dart';
import 'package:r6soperationboard/data/gadget/PublicGadget.dart';
import 'package:r6soperationboard/data/operator/DefenseOperator.dart';
import 'package:r6soperationboard/widget/moveicon/GadgetIcon.dart';

import '../../data/operator/Operator.dart';
import '../../main.dart';
import '../moveicon/OperatorIcon.dart';

class PublicGadgetDrawer {
  PublicGadgetDrawer(this.state);

  final MyStatefulWidgetState state;

  late final _color = const Color(0xFFE8C515);
  final _brightColor = const Color(0xFFE8D98B);

  ///Drawer
  Drawer getDrawer() => Drawer(width: 213, backgroundColor: _brightColor, child: ListView(padding: EdgeInsets.zero, children: _buttonList()));

  ///Drawer List
  List<Widget> _buttonList() {
    final List<Widget> list = [_drawerHeader()];

    for (var gadget in PublicGadget.values) {
      list.add(_createButton(gadget));
    }

    return list;
  }

  ///DrawerHeader
  SizedBox _drawerHeader() => SizedBox(
      height: 60,
      child: DrawerHeader(
          decoration: BoxDecoration(color: _color),
          child: const Center(
              child: Text(
            '공용 가젯 아이콘 생성',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ))));

  ///ListTile
  ListTile _createButton(PublicGadget gadget) => ListTile(
      tileColor: _brightColor,
      leading: const Icon(Icons.add),
      title: Row(
        children: [
          SizedBox(width: 45, height: 45, child: Image.asset(gadget.path())),
          Text(gadget.korean),
        ],
      ),
      onTap: () {
        state.setState(() {
          GadgetIcon.center(state, gadget);
          Navigator.pop(state.context);
        });
      });
}
