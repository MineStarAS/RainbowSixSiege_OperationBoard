// ignore_for_file: file_names, constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'package:r6splannerboard/data/gadget/Gadget.dart';
import 'package:r6splannerboard/data/operator/AttackOperator.dart';
import 'package:r6splannerboard/data/operator/DefenseOperator.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';

enum OperatorGadget implements Gadget {
  Prisma(DefenseOperator.ALIBI, 10),
  SuryaGate(DefenseOperator.ARUNI, 45),
  ShockWire(DefenseOperator.BANDIT, 45),
  ArmorPanel(DefenseOperator.BANDIT, 45),
  Yokai(DefenseOperator.BANDIT, 0),
  GRZMOTMine(DefenseOperator.ELA, 45),
  WelcomeMat(DefenseOperator.FROST, 15),
  VolcanCanister(DefenseOperator.GOYO, 45),
  TraxStingers(AttackOperator.GRIDLOCK, 0),
  ActiveDefenseSystem(DefenseOperator.JAGER, 0),
  RtilaElectroclaw(DefenseOperator.KAID, 0),
  EntryDenialDevice(DefenseOperator.KAPKAN, 0),
  GU(DefenseOperator.LESION, 0),
  EvilEye(DefenseOperator.MAESTRO, 0),
  EvilEyeVertical(DefenseOperator.MAESTRO, 45),
  BANSHEESonicDefence(DefenseOperator.MELUSI, 0),
  BlackMirror(DefenseOperator.MIRA, 45),
  Pest(DefenseOperator.MOZZIE, 0),
  SignalDisruptor(DefenseOperator.MUTE, 45),
  Airjab(AttackOperator.NOMAD, 0),
  Talon8Shield(AttackOperator.OSA, 10),
  RemoteGasGrenade(DefenseOperator.SMOKE, 0),
  RemoteGasGrenadeEffect(DefenseOperator.SMOKE, 0),
  KonaStation(DefenseOperator.THUNDERBIRD, 0),
  BlackEye(DefenseOperator.VALKYRIE, 0),
  Mag_NET_System(DefenseOperator.WAMAI, 0),
  ARGUS(AttackOperator.ZERO, 0),
  ;

  const OperatorGadget(this.operator, this.angleStep);

  final Operator operator;

  getPath() => "assets/gadget/Gadget_${operator.enumName}.png";

  @override
  final int angleStep;
}
