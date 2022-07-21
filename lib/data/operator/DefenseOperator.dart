// ignore_for_file: file_names, constant_identifier_names, recursive_getters

import 'package:r6splannerboard/data/gadget/Gadget.dart';
import 'package:r6splannerboard/data/gadget/OperatorGadget.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';

enum DefenseOperator implements Operator {
  SMOKE("스모크", {OperatorGadget.RemoteGasGrenade}),
  MUTE("뮤트", {OperatorGadget.SignalDisruptor}),
  CASTLE("캐슬", {OperatorGadget.ArmorPanel}),
  PULSE("펄스", {}),
  DOC("닥", {}),
  ROOK("룩", {}),
  KAPKAN("캅칸", {OperatorGadget.EntryDenialDevice}),
  TACHANKA("타찬카", {}),
  JAGER("예거", {OperatorGadget.ActiveDefenseSystem}),
  BANDIT("밴딧", {OperatorGadget.ShockWire}),
  FROST("프로스트", {OperatorGadget.WelcomeMat}),
  VALKYRIE("발키리", {OperatorGadget.BlackEye}),
  CAVEIRA("카베이라", {}),
  ECHO("에코", {OperatorGadget.Yokai}),
  MIRA("미라", {OperatorGadget.BlackMirror}),
  LESION("리전", {OperatorGadget.GU}),
  ELA("엘라", {OperatorGadget.GRZMOTMine}),
  VIGIL("비질", {}),
  MAESTRO("마에스트로", {OperatorGadget.EvilEye}),
  ALIBI("알리바이", {OperatorGadget.Prisma}),
  CLASH("클래쉬", {}),
  KAID("카이드", {OperatorGadget.RtilaElectroclaw}),
  MOZZIE("모지", {OperatorGadget.Pest}),
  WARDEN("워든", {}),
  GOYO("고요", {OperatorGadget.VolcanCanister}),
  WAMAI("와마이", {OperatorGadget.Mag_NET_System}),
  ORYX("오릭스", {}),
  MELUSI("멜루시", {OperatorGadget.BANSHEESonicDefence}),
  ARUNI("아루니", {OperatorGadget.SuryaGate}),
  THUNDERBIRD("썬더버드", {OperatorGadget.KonaStation}),
  THORN("쏜", {}),
  AZAMI("아자미", {}),
  ;

  const DefenseOperator(this.korean, this.gadgets);

  @override
  final String korean;

  @override
  final TeamType teamType = TeamType.defense;

  @override
  String get enumName => name;

  @override
  String get path => "assets/operator/${teamType.name}/$enumName.png";

  @override
  final Set<Gadget> gadgets;
}
