import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';

class AddIconSizeButton extends Button {
  AddIconSizeButton(this.state, this.color, this.size);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
        onPressed: () {
          state.setState(() {
            state.addDefaultMoveIconSize(5);
          });
        },
        style: buttonStyleDefault(),
        child: const Icon(Icons.add, color: Colors.white),
      );
}
