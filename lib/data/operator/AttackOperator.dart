// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'package:r6soperationboard/data/gadget/OperatorGadget.dart';
import 'package:r6soperationboard/data/gadget/PublicGadget.dart';
import 'package:r6soperationboard/data/operator/Operator.dart';
import 'package:r6soperationboard/main.dart';

import '../gadget/Gadget.dart';

enum AttackOperator implements Operator {
  SLEDGE([PublicGadget.FragGrenade, PublicGadget.StunGrenade]),
  THATCHER([PublicGadget.BreachCharge, PublicGadget.Claymore]),
  ASH([PublicGadget.BreachCharge, PublicGadget.Claymore]),
  THERMITE([PublicGadget.SmokeGrenade, PublicGadget.StunGrenade]),
  TWITCH([PublicGadget.Claymore, PublicGadget.SmokeGrenade]),
  MONTAGNE([PublicGadget.HardBreachCharge, PublicGadget.SmokeGrenade]),
  GLAZ([PublicGadget.SmokeGrenade, PublicGadget.FragGrenade]),
  FUZE([PublicGadget.BreachCharge, PublicGadget.HardBreachCharge]),
  BLITZ([PublicGadget.SmokeGrenade, PublicGadget.BreachCharge]),
  IQ([PublicGadget.BreachCharge, PublicGadget.Claymore]),
  BUCK([PublicGadget.StunGrenade, PublicGadget.HardBreachCharge]),
  BLACKBEARD([PublicGadget.Claymore, PublicGadget.StunGrenade]),
  CAPITAO([PublicGadget.Claymore, PublicGadget.HardBreachCharge]),
  HIBANA([PublicGadget.StunGrenade, PublicGadget.BreachCharge]),
  JACKAL([PublicGadget.Claymore, PublicGadget.SmokeGrenade]),
  YING([PublicGadget.HardBreachCharge, PublicGadget.SmokeGrenade]),
  ZOFIA([PublicGadget.BreachCharge, PublicGadget.Claymore]),
  DOKKAEBI([PublicGadget.SmokeGrenade, PublicGadget.StunGrenade]),
  LION([PublicGadget.StunGrenade, PublicGadget.Claymore]),
  FINKA([PublicGadget.FragGrenade, PublicGadget.StunGrenade]),
  MAVERICK([PublicGadget.FragGrenade, PublicGadget.Claymore]),
  NOMAD([OperatorGadget.Airjab, PublicGadget.StunGrenade, PublicGadget.BreachCharge]),
  GRIDLOCK([OperatorGadget.TraxStingers,PublicGadget.SmokeGrenade, PublicGadget.BreachCharge]),
  NOKK([PublicGadget.FragGrenade, PublicGadget.HardBreachCharge]),
  AMARU([PublicGadget.HardBreachCharge, PublicGadget.StunGrenade]),
  KALI([PublicGadget.Claymore, PublicGadget.BreachCharge]),
  IANA([PublicGadget.FragGrenade, PublicGadget.SmokeGrenade]),
  ACE([PublicGadget.BreachCharge, PublicGadget.Claymore]),
  ZERO([OperatorGadget.ARGUS,PublicGadget.HardBreachCharge, PublicGadget.Claymore]),
  FLORES([PublicGadget.StunGrenade, PublicGadget.Claymore]),
  OSA([OperatorGadget.Talon8Shield,PublicGadget.SmokeGrenade, PublicGadget.Claymore]),
  SENS([PublicGadget.HardBreachCharge, PublicGadget.Claymore]),
  ;

  const AttackOperator(this.gadgets);

  @override
  final TeamType teamType = TeamType.attack;

  @override
  String path() => "assets/operator/${teamType.name}/$name.png";

  @override
  String translationString() => Static.state.language.attackOperator(name);

  @override
  final List<Gadget> gadgets;
}
