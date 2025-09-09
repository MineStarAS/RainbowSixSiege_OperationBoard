// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r6soperationboard/main.dart';

abstract class Button {
  late final Color color;

  late final Size size;

  late final dynamic texture;

  late final VoidCallback onClick;

  Color disableColor(bool isSelected) {
    if (isSelected) return color.withValues(alpha: 0.4);
    return color;
  }

  Widget textureWidget() {
    if (texture is String) return Text(texture, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white));
    if (texture is Icons) return Icon(texture, color: Colors.white);
    return const Text('null', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600));
  }

  Widget button() => ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
        child: textureWidget(),
      );

  ButtonStyle buttonStyleDefault() => ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color, padding: EdgeInsets.zero);
  ButtonStyle buttonStyleBackgroundColor(Color color) => ElevatedButton.styleFrom(fixedSize: size, backgroundColor: disableColor(Static.state.sketchColor == color), padding: EdgeInsets.zero);
    Text getLocalData(String key) => Text(Static.state.language.main(key), style: defaultTextStyle());
  TextStyle defaultTextStyle() => TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
}
