// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6soperationboard/data/operator/DefenseOperator.dart';

import '../../data/operator/Operator.dart';
import '../../main.dart';
import '../moveicon/OperatorIcon.dart';

class DefenseOpDrawer {
  DefenseOpDrawer(this.state);

  final MyStatefulWidgetState state;

  late final _color = state.defenseTeamColor;
  final _brightColor = const Color(0xFFE8B58B);

  /// Operator Drawer
  Drawer getDrawer() => Drawer(width: 225, backgroundColor: _brightColor, child: ListView(padding: EdgeInsets.zero, children: _opIconButtonList()));

  /// Operator Drawer List
  List<Widget> _opIconButtonList() {
    final List<Widget> list = [_opDrawerHeader()];

    for (var op in DefenseOperator.values) {
      list.add(_opIconCreateButton(op));
    }

    return list;
  }

  ///Operator DrawerHeader
  SizedBox _opDrawerHeader() => SizedBox(
      height: 60,
      child: DrawerHeader(
        decoration: BoxDecoration(color: _color),
        child:  Center(
          child: Text(
            state.language.defenceOperator('Title'),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ));

  /// Operator ListTile
  ListTile _opIconCreateButton(Operator operator) => ListTile(
      tileColor: _brightColor,
      leading: const Icon(Icons.add),
      title: Row(
        children: [
          SizedBox(width: 45, height: 45, child: Image.asset(operator.path())),
          Text(operator.translationString()),
        ],
      ),
      onTap: () {
        state.setState(() {
          OperatorIcon.center(state, operator);
          Navigator.pop(state.context);
        });
      });
}
