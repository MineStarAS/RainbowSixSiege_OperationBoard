// ignore_for_file: file_names

import 'package:r6soperationboard/data/gadget/OperatorGadget.dart';
import 'package:r6soperationboard/data/gadget/PublicGadget.dart';

import '../gadget/Gadget.dart';

abstract class Operator {
  const Operator(
    this.teamType,
    this.gadgets,
  );

  final TeamType teamType;

  String path();

  String translationString();

  final List<Gadget> gadgets;
}

enum TeamType {
  attack,
  defense;

  const TeamType();
}
