// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'package:r6splannerboard/data/gadget/OperatorGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';

import '../gadget/Gadget.dart';

enum AttackOperator implements Operator {
  SLEDGE("슬레지", [PublicGadget.FragGrenade, PublicGadget.StunGrenade]),
  THATCHER("대처", [PublicGadget.BreachCharge, PublicGadget.Claymore]),
  ASH("애쉬", [PublicGadget.BreachCharge, PublicGadget.Claymore]),
  THERMITE("써마이트", [PublicGadget.SmokeGrenade, PublicGadget.StunGrenade]),
  TWITCH("트위치", [PublicGadget.Claymore, PublicGadget.SmokeGrenade]),
  MONTAGNE("몽타뉴", [PublicGadget.HardBreachCharge, PublicGadget.SmokeGrenade]),
  GLAZ("글라즈", [PublicGadget.SmokeGrenade, PublicGadget.FragGrenade]),
  FUZE("퓨즈", [PublicGadget.BreachCharge, PublicGadget.HardBreachCharge]),
  BLITZ("블리츠", [PublicGadget.SmokeGrenade, PublicGadget.BreachCharge]),
  IQ("아이큐", [PublicGadget.BreachCharge, PublicGadget.Claymore]),
  BUCK("벅", [PublicGadget.StunGrenade, PublicGadget.HardBreachCharge]),
  BLACKBEARD("블랙비어드", [PublicGadget.Claymore, PublicGadget.StunGrenade]),
  CAPITAO("카피탕", [PublicGadget.Claymore, PublicGadget.HardBreachCharge]),
  HIBANA("히바나", [PublicGadget.StunGrenade, PublicGadget.BreachCharge]),
  JACKAL("자칼", [PublicGadget.Claymore, PublicGadget.SmokeGrenade]),
  YING("잉", [PublicGadget.HardBreachCharge, PublicGadget.SmokeGrenade]),
  ZOFIA("조피아", [PublicGadget.BreachCharge, PublicGadget.Claymore]),
  DOKKAEBI("도깨비", [PublicGadget.SmokeGrenade, PublicGadget.StunGrenade]),
  LION("라이온", [PublicGadget.StunGrenade, PublicGadget.Claymore]),
  FINKA("핀카", [PublicGadget.FragGrenade, PublicGadget.StunGrenade]),
  MAVERICK("매버릭", [PublicGadget.FragGrenade, PublicGadget.Claymore]),
  NOMAD("노마드", [OperatorGadget.Airjab, PublicGadget.StunGrenade, PublicGadget.BreachCharge]),
  GRIDLOCK("그리드락", [OperatorGadget.TraxStingers,PublicGadget.SmokeGrenade, PublicGadget.BreachCharge]),
  NOKK("뇌크", [PublicGadget.FragGrenade, PublicGadget.HardBreachCharge]),
  AMARU("아마루", [PublicGadget.HardBreachCharge, PublicGadget.StunGrenade]),
  KALI("칼리", [PublicGadget.Claymore, PublicGadget.BreachCharge]),
  IANA("야나", [PublicGadget.FragGrenade, PublicGadget.SmokeGrenade]),
  ACE("에이스", [PublicGadget.BreachCharge, PublicGadget.Claymore]),
  ZERO("제로", [OperatorGadget.ARGUS,PublicGadget.HardBreachCharge, PublicGadget.Claymore]),
  FLORES("플로레스", [PublicGadget.StunGrenade, PublicGadget.Claymore]),
  OSA("오사", [OperatorGadget.Talon8Shield,PublicGadget.SmokeGrenade, PublicGadget.Claymore]),
  SENS("센스", [PublicGadget.HardBreachCharge, PublicGadget.Claymore]),
  ;

  const AttackOperator(this.korean, this.gadgets);

  @override
  final String korean;

  @override
  final TeamType teamType = TeamType.attack;

  @override
  String get enumName => name;

  @override
  String path() => "assets/operator/${teamType.name}/$enumName.png";

  @override
  final List<Gadget> gadgets;
}
