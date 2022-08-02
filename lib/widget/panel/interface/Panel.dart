// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import '../../../main.dart';

abstract class Panel {
  late final MyStatefulWidgetState state;

  late final double offsetX;
  late final double offsetY;

  late final offsetBox = SizedBox(width: offsetX, height: offsetY);

  customOffsetBox(double offset) => SizedBox(width: offset, height: offset);

  Widget widget();
}
