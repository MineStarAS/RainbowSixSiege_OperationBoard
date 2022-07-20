// ignore_for_file: file_names, constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'package:r6splannerboard/data/gadget/Gadget.dart';
import 'package:r6splannerboard/data/operator/AttackOperator.dart';
import 'package:r6splannerboard/data/operator/DefenseOperator.dart';
import 'package:r6splannerboard/data/operator/Operator.dart';

enum PublicGadget implements Gadget {
  Barb(90),
  Barricade(45),
  BulletProofCam(45),
  C4(0),
  Claymore(10),
  Drone(10),
  ImpactGrenade(0),
  ProximityMine(0),
  Shield(10),
  SmokeGrenade_Effect(0),
  ;

  const PublicGadget(this.angleStep);

  getPath() => "assets/gadget/Gadget_$name.png";

  @override
  final int angleStep;
}
