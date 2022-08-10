// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';

import '../../main.dart';

class LanguageDrawer {
  LanguageDrawer(this.state);

  final MyStatefulWidgetState state;

  late final _color = Colors.blue;
  final _brightColor = const Color(0xFF9DCFF2);

  ///Drawer
  Drawer getDrawer() => Drawer(width: 200, backgroundColor: _brightColor, child: ListView(padding: EdgeInsets.zero, children: _buttonList()));

  ///Drawer List
  List<Widget> _buttonList() {
    final List<Widget> list = [_drawerHeader()];

    Directory('assets/language').listSync().forEach((file) {
      list.add(_createButton(file));
    });

    return list;
  }

  ///DrawerHeader
  SizedBox _drawerHeader() => SizedBox(
      height: 60,
      child: DrawerHeader(
          decoration: BoxDecoration(color: _color),
          child: const Center(
              child: Text(
            'Select Language',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ))));

  ///ListTile
  ListTile _createButton(FileSystemEntity file) {
    final language = file.path.replaceAll('${file.parent.path}/', '').replaceAll('${file.parent.path}\\', '').replaceAll('.yml', '');

    return ListTile(
        tileColor: _brightColor,
        leading: const Icon(Icons.add),
        title: Row(
          children: [
            Text(language, style: const TextStyle(fontSize: 16)),
          ],
        ),
        onTap: () {
          state.setState(() {
            state.language.changeLanguage(language);
            Navigator.pop(state.context);
          });
        });
  }
}
