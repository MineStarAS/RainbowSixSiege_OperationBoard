// ignore_for_file: invalid_use_of_protected_member, file_names

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../data/operator/AttackOperator.dart';
import '../../data/operator/Operator.dart';
import '../moveicon/OperatorIcon.dart';

class AttackOpDrawer {
  AttackOpDrawer(this.state);
  MyStatefulWidgetState state;

  late final teamColor = state.attackTeamColor;
  final brightTeamColor = const Color(0xFF7BB3E0);

  /// Operator Drawer
  Drawer getDrawer() => Drawer(width: 200,backgroundColor: brightTeamColor, child: ListView(padding: EdgeInsets.zero, children: _opIconButtonList()));

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
        decoration: BoxDecoration(color: teamColor),
        child: const Center(
          child: Text(
            '오퍼레이터 아이콘 생성',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ));

  /// Operator ListTile
  ListTile _opIconCreateButton(Operator operator) => ListTile(
      tileColor: brightTeamColor,
      leading: const Icon(Icons.add),
      title: Row(
        children: [
          SizedBox(width: 45, height: 45, child: Image.asset(operator.path())),
          Text(operator.korean),
        ],
      ),
      onTap: () {
        state.setState(() {
          OperatorIcon(state, operator, 150, 200);
          Navigator.pop(state.context);
        });
      });
}
