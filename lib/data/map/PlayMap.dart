// ignore_for_file: file_names, constant_identifier_names

import 'package:r6soperationboard/data/map/Floor.dart';
import 'package:r6soperationboard/data/map/HasFloor.dart';

enum PlayMap {
  BANK('은행', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  BORDER('국경', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  CHALET('별장', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  CLUB_HOUSE('클럽하우스', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  COAST_LINE('해안선', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  CONSULATE('영사관', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  FAVELA('빈민가', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2, Floor.F3})),
  FORTRESS('요새', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  HEREFORD('해리퍼드 기지', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2, Floor.F3})),
  HOUSE('하우스', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  KAFE('도스토예프스키 카페', HasFloor(<Floor>{Floor.F1, Floor.F2, Floor.F3})),
  KANAL('운하', HasFloor(<Floor>{Floor.B2, Floor.B1, Floor.F1, Floor.F2})),
  OREGON('오리건', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2, Floor.F3})),
  OUTBACK('오지', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  PLANE('대통령 전용기', HasFloor(<Floor>{Floor.F1, Floor.F2, Floor.F3})),
  SKYSCRAPER('마천루', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  THEME_PARK('테마파크', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  TOWER('타워', HasFloor(<Floor>{Floor.F1, Floor.F2})),
  VILLA('빌라', HasFloor(<Floor>{Floor.B1, Floor.F1, Floor.F2})),
  YACHT('요트', HasFloor(<Floor>{Floor.F1, Floor.F2, Floor.F3, Floor.F4})),
  ;

  const PlayMap(this.korean, this.hasFloor);

  final String korean;
  final HasFloor hasFloor;

  String path(Floor floor) {
    if (hasFloor.contains(floor)) return "assets/map/${name}_${floor.string}.jpg";
    return "assets/map/${name}_${Floor.F1.string}.jpg";
  }
}
