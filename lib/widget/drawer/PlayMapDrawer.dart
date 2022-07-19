// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:r6splannerboard/data/operator/DefenseOperator.dart';

import '../../Main.dart';
import '../../data/map/PlayMap.dart';

class PlayMapDrawer {

  PlayMapDrawer(this.state);
  MyStatefulWidgetState state;

  /// Map Drawer
  Drawer getDrawer() => Drawer(width: 230, child: ListView(padding: EdgeInsets.zero, children: _mapIconButtonList()));

  /// Map Drawer List
  List<Widget> _mapIconButtonList() {
    final List<Widget> list = [_mapDrawerHeader()];

    for (var map in PlayMap.values) {
      list.add(_mapIconCreateButton(map));
    }

    return list;
  }

  ///Map DrawerHeader
  SizedBox _mapDrawerHeader() => const SizedBox(
      height: 60,
      child: DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text(
            '맵 선택',
            style: TextStyle(fontWeight: FontWeight.w600),
          )));

  /// Map ListTile
  ListTile _mapIconCreateButton(PlayMap playMap) => ListTile(
      leading: const Icon(Icons.add),
      title: Text(playMap.korean, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: () {
        state.setState(() {
          state.setPlayMap(playMap);
          Navigator.pop(state.context);
        });
      });
}