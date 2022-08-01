// ignore_for_file: file_names, constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'package:r6splannerboard/data/gadget/Gadget.dart';

enum OperatorGadget implements Gadget {
  Prisma("ALIBI", 10, GadgetOtherImage.Null),
  SuryaGate("ARUNI", 45, GadgetOtherImage.Null),
  ShockWire("BANDIT", 45, GadgetOtherImage.Null),
  ArmorPanel("CASTLE", 45, GadgetOtherImage.Null),
  Yokai("ECHO", 45, GadgetOtherImage.Null),
  GRZMOTMine("ELA", 45, GadgetOtherImage.Null),
  WelcomeMat("FROST", 15, GadgetOtherImage.Null),
  VolcanCanister("GOYO", 45, GadgetOtherImage.Null),
  TraxStingers("GRIDLOCK", 45, GadgetOtherImage.Null),
  ActiveDefenseSystem("JAGER", 45, GadgetOtherImage.Null),
  RtilaElectroclaw("KAID", 45, GadgetOtherImage.Null),
  EntryDenialDevice("KAPKAN", 45, GadgetOtherImage.Null),
  GU("LESION", 45, GadgetOtherImage.Null),
  EvilEye("MAESTRO", 45, GadgetOtherImage.Vertical),
  BANSHEESonicDefence("MELUSI", 45, GadgetOtherImage.Null),
  BlackMirror("MIRA", 45, GadgetOtherImage.Null),
  Pest("MOZZIE", 45, GadgetOtherImage.Null),
  SignalDisruptor("MUTE", 45, GadgetOtherImage.Null),
  Airjab("NOMAD", 45, GadgetOtherImage.Null),
  Talon8Shield("OSA", 10, GadgetOtherImage.Null),
  RemoteGasGrenade("SMOKE", 45, GadgetOtherImage.Activate),
  KonaStation("THUNDERBIRD", 45, GadgetOtherImage.Null),
  BlackEye("VALKYRIE", 45, GadgetOtherImage.Null),
  Mag_NET_System("WAMAI", 45, GadgetOtherImage.Null),
  ARGUS("ZERO", 45, GadgetOtherImage.Null),
  ;

  const OperatorGadget(this.operatorName, this.angleStep, this.hasOtherImage);

  final String operatorName;

  @override
  String path() => "assets/gadget/operator/Gadget_$operatorName.png";

  @override
  String? otherPath() {
    if (hasOtherImage == GadgetOtherImage.Null) return null;
    return "assets/gadget/operator/Gadget_${operatorName}_$hasOtherImage.png";
  }

  @override
  final int angleStep;

  @override
  final GadgetOtherImage hasOtherImage;
}
