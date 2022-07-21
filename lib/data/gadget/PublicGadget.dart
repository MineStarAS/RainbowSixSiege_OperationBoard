// ignore_for_file: file_names, constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'package:r6splannerboard/data/gadget/Gadget.dart';

enum PublicGadget implements Gadget {
  Barb(90, GadgetOtherImage.Null),
  Barricade(45, GadgetOtherImage.Null),
  BulletProofCam(15, GadgetOtherImage.Vertical),
  C4(0, GadgetOtherImage.Null),
  Claymore(10, GadgetOtherImage.Null),
  Drone(10, GadgetOtherImage.Null),
  ImpactGrenade(0, GadgetOtherImage.Null),
  ProximityMine(0, GadgetOtherImage.Null),
  Shield(10, GadgetOtherImage.Null),
  FragGrenade(0, GadgetOtherImage.Null),
  SmokeGrenade(0, GadgetOtherImage.Activate),
  StunGrenade(0, GadgetOtherImage.Null),
  ;

  const PublicGadget(this.angleStep, this.hasOtherImage);

  getPath() => "assets/gadget/Gadget_$name.png";

  getOtherPath() {
    if (hasOtherImage == GadgetOtherImage.Null) return null;
    return "assets/gadget/Gadget_$hasOtherImage.png";
  }

  @override
  final int angleStep;

  @override
  final GadgetOtherImage hasOtherImage;
}
