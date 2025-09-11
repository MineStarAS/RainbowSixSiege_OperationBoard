import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

class IconClearButton extends Button {
  IconClearButton(this.state, this.color, this.size);

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
        style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
        child: Text(state.language.main('icon_clear'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
      );
}
