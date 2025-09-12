// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../main.dart';

class PlayMapImage {
  PlayMapImage(this.state);

  late final MyStatefulWidgetState state;

  _offsetX() => state.getPlayMapOffsetX() / state.mapWidth();
  _offsetY() => state.getPlayMapOffsetY() / state.mapHeight();

  widget() => Center(
      child: SizedBox(
          width: state.mapWidth(),
          height: state.mapHeight(),
          child: ClipRect(
              child: PhotoView(
            imageProvider: AssetImage(state.playMap.path(state.floor)),
            minScale: 1.0,
            initialScale: state.getPlayMapScale(),
            basePosition: Alignment(_offsetX(), _offsetY()),
                backgroundDecoration: BoxDecoration(color: Color.fromARGB(255, 230, 230, 255)),
          ))));
}
