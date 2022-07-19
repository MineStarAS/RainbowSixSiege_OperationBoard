// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'dart:ui';

import 'package:r6splannerboard/data/operator/Operator.dart';

enum AttackOperator implements Operator {
  SLEDGE("슬레지"),
  THATCHER("대처"),
  ASH("애쉬"),
  THERMITE("써마이트"),
  TWITCH("트위치"),
  MONTAGNE("몽타뉴"),
  GLAZ("글라즈"),
  FUZE("퓨즈"),
  BLITZ("블리츠"),
  IQ("아이큐"),
  BUCK("벅"),
  BLACKBEARD("블랙비어드"),
  CAPITAO("카피탕"),
  HIBANA("히바나"),
  JACKAL("자칼"),
  YING("잉"),
  ZOFIA("조피아"),
  DOKKAEBI("도깨비"),
  LION("라이온"),
  FINKA("핀카"),
  MAVERICK("매버릭"),
  NOMAD("노마드"),
  GRIDLOCK("그리드락"),
  NOKK("뇌크"),
  AMARU("아마루"),
  KALI("칼리"),
  IANA("야나"),
  ACE("에이스"),
  ZERO("제로"),
  FLORES("플로레스"),
  OSA("오사"),
  SENS("센스"),
  ;

  const AttackOperator(this.korean);

  @override
  final String korean;

  @override
  final TeamType teamType = TeamType.attack;

  @override
  String get enumName => name;

  @override
  String get path => "assets/operator/${teamType.name}/$enumName.png";


}
