// ignore_for_file: invalid_use_of_protected_member, file_names

import 'package:flutter/material.dart';

import '../../data/operator/AttackOperator.dart';
import '../../data/operator/Operator.dart';
import '../../main.dart';
import '../moveicon/OperatorIcon.dart';

class AttackOpDrawer {
  AttackOpDrawer(this.state);

  MyStatefulWidgetState state;

  late final _color = Static.attackTeamColor;
  final _brightColor = const Color(0xFF7BB3E0);

  /// Operator Drawer
  Drawer getDrawer() => Drawer(width: 225, backgroundColor: _brightColor, child: ListView(padding: EdgeInsets.zero, children: _opIconButtonList()));

  /// Operator Drawer List
  List<Widget> _opIconButtonList() {
    final List<Widget> list = [_opDrawerHeader()];

    for (var op in AttackOperator.values) {
      list.add(_opIconCreateButton(op));
    }
    return list;
  }

  ///Operator DrawerHeader
  SizedBox _opDrawerHeader() => SizedBox(
      height: 60,
      child: DrawerHeader(
        decoration: BoxDecoration(color: _color),
        child: Center(
          child: Text(
            state.language.attackOperator('Title'),
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
