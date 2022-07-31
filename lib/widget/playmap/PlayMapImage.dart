// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

import '../../main.dart';

class PlayMapImage {
  PlayMapImage(this.state);

  late final MyStatefulWidgetState state;

  _offsetX() {
    var newValue = state.getPlayMapOffsetX() / state.mapWidth;

    if (1.0 < newValue) {
      newValue = 1.0;
    } else if (newValue < -1.0) {
      newValue = -1.0;
    }

    return newValue;
  }

  _offsetY() {
    var newValue = state.getPlayMapOffsetY() / state.mapHeight;

    if (1.0 < newValue) {
      newValue = 1.0;
    } else if (newValue < -1.0) {
      newValue = -1.0;
    }

    return newValue;
  }

  widget() => Center(
      child: SizedBox(
          width: state.mapWidth,
          height: state.mapHeight,
          child: ClipRect(
              child: PhotoView(
            imageProvider: AssetImage(state.playMap.path(state.floor)),
            minScale: 1.0,
            initialScale: state.getPlayMapScale(),
            basePosition: Alignment(_offsetX(), _offsetY()),
          ))));
}
