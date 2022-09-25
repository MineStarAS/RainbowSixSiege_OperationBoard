// ignore_for_file: file_names, constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'package:r6soperationboard/data/gadget/Gadget.dart';
import 'package:r6soperationboard/main.dart';

enum PublicGadget implements Gadget {
  Drone(10, GadgetOtherImage.Null),
  Barricade(45, GadgetOtherImage.Null),
  Claymore(10, GadgetOtherImage.Null),
  BreachCharge(45, GadgetOtherImage.Null),
  HardBreachCharge(45, GadgetOtherImage.Null),
  FragGrenade(45, GadgetOtherImage.Null),
  SmokeGrenade(45, GadgetOtherImage.Activate),
  StunGrenade(45, GadgetOtherImage.Null),
  Barb(90, GadgetOtherImage.Null),
  ProximityMine(45, GadgetOtherImage.Null),
  BulletProofCamera(45, GadgetOtherImage.Vertical),
  Shield(10, GadgetOtherImage.Null),
  C4(45, GadgetOtherImage.Null),
  ImpactGrenade(45, GadgetOtherImage.Null),
  ImpactEMPGrenade(45, GadgetOtherImage.Null),
  ;

  const PublicGadget(this.angleStep, this.hasOtherImage);

  @override
  String path() => "assets/gadget/public/Gadget_$name.png";

  @override
  String? otherPath() {
    if (hasOtherImage == GadgetOtherImage.Null) return null;
    return "assets/gadget/public/Gadget_${name}_${hasOtherImage.name}.png";
  }

  @override
  final int angleStep;

  @override
  final GadgetOtherImage hasOtherImage;

  String translationString() => Static.state.language.publicGadget(name);
}
