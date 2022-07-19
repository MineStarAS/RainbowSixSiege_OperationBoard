// ignore_for_file: file_names

import 'Floor.dart';

class HasFloor {
  const HasFloor(this._floorSet);
  final Set<Floor> _floorSet;

  contains(Floor floor) => _floorSet.contains(floor);

  values() => _floorSet.toList();
}