// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'package:r6soperationboard/data/gadget/Gadget.dart';
import 'package:r6soperationboard/data/gadget/OperatorGadget.dart';
import 'package:r6soperationboard/data/gadget/PublicGadget.dart';
import 'package:r6soperationboard/data/operator/Operator.dart';
import 'package:r6soperationboard/main.dart';

enum DefenseOperator implements Operator {
  SMOKE([OperatorGadget.RemoteGasGrenade, PublicGadget.Barb, PublicGadget.Shield]),
  MUTE([OperatorGadget.SignalDisruptor, PublicGadget.C4, PublicGadget.BulletProofCamera]),
  CASTLE([OperatorGadget.ArmorPanel, PublicGadget.BulletProofCamera, PublicGadget.ProximityMine]),
  PULSE([PublicGadget.Barb, PublicGadget.C4]),
  DOC([PublicGadget.BulletProofCamera, PublicGadget.Barb]),
  ROOK([PublicGadget.ProximityMine, PublicGadget.ImpactGrenade]),
  KAPKAN([OperatorGadget.EntryDenialDevice, PublicGadget.ImpactGrenade, PublicGadget.C4]),
  TACHANKA([PublicGadget.Barb, PublicGadget.Shield]),
  JAGER([OperatorGadget.ActiveDefenseSystem, PublicGadget.BulletProofCamera, PublicGadget.Barb]),
  BANDIT([OperatorGadget.ShockWire, PublicGadget.Barb, PublicGadget.C4]),
  FROST([OperatorGadget.WelcomeMat, PublicGadget.BulletProofCamera, PublicGadget.Shield]),
  VALKYRIE([OperatorGadget.BlackEye, PublicGadget.ImpactGrenade, PublicGadget.C4]),
  CAVEIRA([PublicGadget.ImpactGrenade, PublicGadget.BulletProofCamera]),
  ECHO([OperatorGadget.Yokai, PublicGadget.ImpactGrenade, PublicGadget.Shield]),
  MIRA([OperatorGadget.BlackMirror, PublicGadget.ProximityMine, PublicGadget.C4]),
  LESION([OperatorGadget.GU, PublicGadget.ImpactGrenade, PublicGadget.BulletProofCamera]),
  ELA([OperatorGadget.GRZMOTMine, PublicGadget.Barb, PublicGadget.Shield]),
  VIGIL([PublicGadget.BulletProofCamera, PublicGadget.ImpactGrenade]),
  MAESTRO([OperatorGadget.EvilEye, PublicGadget.Barb, PublicGadget.ImpactGrenade]),
  ALIBI([OperatorGadget.Prisma, PublicGadget.ImpactGrenade, PublicGadget.Shield]),
  CLASH([PublicGadget.Barb, PublicGadget.ImpactGrenade]),
  KAID([OperatorGadget.RtilaElectroclaw, PublicGadget.C4, PublicGadget.Barb]),
  MOZZIE([OperatorGadget.Pest, PublicGadget.Barb, PublicGadget.C4]),
  WARDEN([PublicGadget.Shield, PublicGadget.C4]),
  GOYO([OperatorGadget.VolcanCanister, PublicGadget.ProximityMine, PublicGadget.C4]),
  WAMAI([OperatorGadget.Mag_NET_System, PublicGadget.ImpactGrenade, PublicGadget.ProximityMine]),
  ORYX([PublicGadget.Barb, PublicGadget.ProximityMine]),
  MELUSI([OperatorGadget.BANSHEESonicDefence, PublicGadget.BulletProofCamera, PublicGadget.ImpactGrenade]),
  ARUNI([OperatorGadget.SuryaGate, PublicGadget.Barb, PublicGadget.BulletProofCamera]),
  THUNDERBIRD([OperatorGadget.KonaStation, PublicGadget.ImpactGrenade, PublicGadget.C4]),
  THORN([PublicGadget.Shield, PublicGadget.Barb]),
  AZAMI([PublicGadget.Barb, PublicGadget.ImpactGrenade]),
  ;

  const DefenseOperator(this.gadgets);

  @override
  final TeamType teamType = TeamType.defense;

  @override
  String path() => "assets/operator/${teamType.name}/$name.png";

  @override
  String translationString() => Static.state.language.defenceOperator(name);

  @override
  final List<Gadget> gadgets;
}
