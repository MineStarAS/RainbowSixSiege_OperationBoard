// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class Button {

  late final Color color;

  late final Size size;

  late final dynamic texture;

  late final VoidCallback onClick;

  disableColor(bool isSelected) {
    if (isSelected) return color.withOpacity(0.4);
    return color;
  }

  Widget textureWidget() {
    if (texture is String) return Text(texture, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600));
    if (texture is Icons) return Icon(texture);
    return const Text('null', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600));
  }

  Widget button() => ElevatedButton(
    onPressed: onClick,
    style: ElevatedButton.styleFrom(fixedSize: size, backgroundColor: color),
    child: textureWidget(),
  );
}