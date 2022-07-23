// ignore_for_file: file_names, constant_identifier_names

abstract class Gadget {
  const Gadget(this.angleStep, this.hasOtherImage);
  final int angleStep;
  final GadgetOtherImage hasOtherImage;

  String path();
  String? otherPath();
}

enum GadgetOtherImage {
  Null, Activate, Vertical
}
