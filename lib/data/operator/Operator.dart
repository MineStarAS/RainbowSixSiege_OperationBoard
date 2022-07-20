// ignore_for_file: file_names

import 'package:r6splannerboard/data/gadget/OperatorGadget.dart';
import 'package:r6splannerboard/data/gadget/PublicGadget.dart';

import '../gadget/Gadget.dart';

abstract class Operator {
  const Operator(
    this.enumName,
    this.korean,
    this.teamType,
    this.path,
    this.gadgets,
  );

  final String enumName;
  final String korean;
  final String path;
  final TeamType teamType;

  final Set<Gadget> gadgets;
}

enum TeamType {
  attack,
  defense;

  const TeamType();
}
