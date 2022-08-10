// ignore_for_file: file_names, constant_identifier_names

import 'package:r6soperationboard/data/map/Floor.dart';
import 'package:r6soperationboard/data/map/HasFloor.dart';
import 'package:r6soperationboard/main.dart';

enum PlayMap {
  BANK(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  BORDER(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  CHALET(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  CLUB_HOUSE(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  COASTLINE(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  CONSULATE(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  FAVELA(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2, Floor.F3})),
  FORTRESS(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  HEREFORD(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2, Floor.F3})),
  HOUSE(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  KAFE(HasFloor(<Floor>{Floor.F1, Floor.F2, Floor.F3})),
  KANAL(HasFloor(<Floor>{Floor.B2, Floor.B1, Floor.F1, Floor.F2})),
  OREGON(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2, Floor.F3})),
  OUTBACK(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  PLANE(HasFloor(<Floor>{Floor.F1, Floor.F2, Floor.F3})),
  SKYSCRAPER(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  THEME_PARK(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  TOWER(HasFloor(<Floor>{Floor.F1, Floor.F2})),
  VILLA(HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  YACHT(HasFloor(<Floor>{Floor.F1, Floor.F2, Floor.F3, Floor.F4})),
  ;

  const PlayMap(this.hasFloor);

  final HasFloor hasFloor;

  String path(Floor floor) {
    if (hasFloor.contains(floor)) return "assets/map/${name}_${floor.string}.jpg";
    return "assets/map/${name}_${Floor.F1.string}.jpg";
  }

  String translationString() => Static.state.language.playMap(name);
}
