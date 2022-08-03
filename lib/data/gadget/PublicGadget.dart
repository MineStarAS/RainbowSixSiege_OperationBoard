// ignore_for_file: file_names, constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'package:r6soperationboard/data/gadget/Gadget.dart';

enum PublicGadget implements Gadget {
  Drone(10, GadgetOtherImage.Null, "정찰 드론"),
  Barricade(45, GadgetOtherImage.Null, "바리게이트"),
  Claymore(10, GadgetOtherImage.Null, "대인지뢰"),
  BreachCharge(45, GadgetOtherImage.Null, "접착폭약"),
  HardBreachCharge(45, GadgetOtherImage.Null, "강력접착폭약"),
  FragGrenade(45, GadgetOtherImage.Null, "수류탄"),
  SmokeGrenade(45, GadgetOtherImage.Activate, "연막탄"),
  StunGrenade(45, GadgetOtherImage.Null, "섬광탄"),
  Barb(90, GadgetOtherImage.Null, "철조망"),
  ProximityMine(45, GadgetOtherImage.Null, "근접 알람"),
  BulletProofCamera(45, GadgetOtherImage.Vertical, "방탄 카메라"),
  Shield(10, GadgetOtherImage.Null, "이동식 방패"),
  C4(45, GadgetOtherImage.Null, "C4"),
  ImpactGrenade(45, GadgetOtherImage.Null, "충격 수류탄"),
  ;

  const PublicGadget(this.angleStep, this.hasOtherImage, this.korean);

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

  final String korean;
}
