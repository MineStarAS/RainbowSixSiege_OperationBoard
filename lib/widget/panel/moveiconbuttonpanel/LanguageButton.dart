import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../drawer/DrawerType.dart';

class LanguageButton extends Button {
  LanguageButton(this.state, this.color, this.size);

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
        style: buttonStyleDefault(),
        child: const Icon(Icons.language, color: Colors.white),
      );
}
