// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'package:r6splannerboard/data/gadget/Gadget.dart';
import 'package:r6splannerboard/data/gadget/OperatorGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';

enum DefenseOperator implements Operator {
  SMOKE("스모크", [OperatorGadget.RemoteGasGrenade, PublicGadget.Barb, PublicGadget.Shield]),
  MUTE("뮤트", [OperatorGadget.SignalDisruptor, PublicGadget.C4, PublicGadget.BulletProofCamera]),
  CASTLE("캐슬", [OperatorGadget.ArmorPanel, PublicGadget.BulletProofCamera, PublicGadget.ProximityMine]),
  PULSE("펄스", [PublicGadget.Barb, PublicGadget.C4]),
  DOC("닥", [PublicGadget.BulletProofCamera, PublicGadget.Barb]),
  ROOK("룩", [PublicGadget.ProximityMine, PublicGadget.ImpactGrenade]),
  KAPKAN("캅칸", [OperatorGadget.EntryDenialDevice, PublicGadget.ImpactGrenade, PublicGadget.C4]),
  TACHANKA("타찬카", [PublicGadget.Barb, PublicGadget.Shield]),
  JAGER("예거", [OperatorGadget.ActiveDefenseSystem, PublicGadget.BulletProofCamera, PublicGadget.Barb]),
  BANDIT("밴딧", [OperatorGadget.ShockWire, PublicGadget.Barb, PublicGadget.C4]),
  FROST("프로스트", [OperatorGadget.WelcomeMat, PublicGadget.BulletProofCamera, PublicGadget.Shield]),
  VALKYRIE("발키리", [OperatorGadget.BlackEye, PublicGadget.ImpactGrenade, PublicGadget.C4]),
  CAVEIRA("카베이라", [PublicGadget.ImpactGrenade, PublicGadget.BulletProofCamera]),
  ECHO("에코", [OperatorGadget.Yokai, PublicGadget.ImpactGrenade, PublicGadget.Shield]),
  MIRA("미라", [OperatorGadget.BlackMirror, PublicGadget.ProximityMine, PublicGadget.C4]),
  LESION("리전", [OperatorGadget.GU, PublicGadget.ImpactGrenade, PublicGadget.BulletProofCamera]),
  ELA("엘라", [OperatorGadget.GRZMOTMine, PublicGadget.Barb, PublicGadget.Shield]),
  VIGIL("비질", [PublicGadget.BulletProofCamera, PublicGadget.ImpactGrenade]),
  MAESTRO("마에스트로", [OperatorGadget.EvilEye, PublicGadget.Barb, PublicGadget.ImpactGrenade]),
  ALIBI("알리바이", [OperatorGadget.Prisma, PublicGadget.ImpactGrenade, PublicGadget.Shield]),
  CLASH("클래쉬", [PublicGadget.Barb, PublicGadget.ImpactGrenade]),
  KAID("카이드", [OperatorGadget.RtilaElectroclaw, PublicGadget.C4, PublicGadget.Barb]),
  MOZZIE("모지", [OperatorGadget.Pest, PublicGadget.Barb, PublicGadget.C4]),
  WARDEN("워든", [PublicGadget.Shield, PublicGadget.C4]),
  GOYO("고요", [OperatorGadget.VolcanCanister, PublicGadget.ProximityMine, PublicGadget.C4]),
  WAMAI("와마이", [OperatorGadget.Mag_NET_System, PublicGadget.ImpactGrenade, PublicGadget.ProximityMine]),
  ORYX("오릭스", [PublicGadget.Barb, PublicGadget.ProximityMine]),
  MELUSI("멜루시", [OperatorGadget.BANSHEESonicDefence, PublicGadget.BulletProofCamera, PublicGadget.ImpactGrenade]),
  ARUNI("아루니", [OperatorGadget.SuryaGate, PublicGadget.Barb, PublicGadget.BulletProofCamera]),
  THUNDERBIRD("썬더버드", [OperatorGadget.KonaStation, PublicGadget.ImpactGrenade, PublicGadget.C4]),
  THORN("쏜", [PublicGadget.Shield, PublicGadget.Barb]),
  AZAMI("아자미", [PublicGadget.Barb, PublicGadget.ImpactGrenade]),
  ;

  const DefenseOperator(this.korean, this.gadgets);

  @override
  final String korean;

  @override
  final TeamType teamType = TeamType.defense;

  @override
  String get enumName => name;

  @override
  String path() => "assets/operator/${teamType.name}/$enumName.png";

  @override
  final List<Gadget> gadgets;
}
