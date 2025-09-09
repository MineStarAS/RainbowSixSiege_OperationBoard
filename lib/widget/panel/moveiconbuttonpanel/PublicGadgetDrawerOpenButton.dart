import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../button/Button.dart';
import '../../drawer/DrawerType.dart';

class PublicGadgetDrawerOpenButton extends Button {
  PublicGadgetDrawerOpenButton(this.state, this.color, this.size);

  final MyStatefulWidgetState state;

  @override
  final Color color;

  @override
  final Size size;

  @override
  button() => ElevatedButton(
    onPressed: () {
      state.openDrawer(DrawerType.publicGadget);
    },
    style:  buttonStyleDefault(),
    child: getLocalData('public_gadget'),
  );
}