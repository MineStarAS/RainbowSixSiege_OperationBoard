// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'package:r6splannerboard/data/operator/Operator.dart';

enum DefenseOperator implements Operator {
  SMOKE("스모크"),
  MUTE("뮤트"),
  CASTLE("캐슬"),
  PULSE("펄스"),
  DOC("닥"),
  ROOK("룩"),
  KAPKAN("캅칸"),
  TACHANKA("타찬카"),
  JAGER("예거"),
  BANDIT("밴딧"),
  FROST("프로스트"),
  VALKYRIE("발키리"),
  CAVEIRA("카베이라"),
  ECHO("에코"),
  MIRA("미라"),
  LESION("리전"),
  ELA("엘라"),
  VIGIL("비질"),
  MAESTRO("마에스트로"),
  ALIBI("알리바이"),
  CLASH("클래쉬"),
  KAID("카이드"),
  MOZZIE("모지"),
  WARDEN("워든"),
  GOYO("고요"),
  WAMAI("와마이"),
  ORYX("오릭스"),
  MELUSI("멜루시"),
  ARUNI("아루니"),
  THUNDERBIRD("썬더버드"),
  THORN("쏜"),
  AZAMI("아자미"),
  ;

  const DefenseOperator(this.korean);

  @override
  final String korean;

  @override
  final TeamType teamType = TeamType.defense;

  @override
  String get enumName => name;

  @override
  String get path => "assets/operator/${teamType.name}/$enumName.png";
}
