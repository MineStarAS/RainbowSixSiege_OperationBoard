import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../drawer/DrawerType.dart';

class AttackOperatorDrawerOpenButton extends Button {
  AttackOperatorDrawerOpenButton(this.state, this.color, this.size);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
    onPressed: () {
      state.openDrawer(DrawerType.attackOperator);
    },
    style: buttonStyleDefault(),
    child: getLocalData('attack'),
  );
}
