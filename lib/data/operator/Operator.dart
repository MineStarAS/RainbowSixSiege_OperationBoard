// ignore_for_file: file_names

abstract class Operator {
  const Operator(this.enumName, this.korean, this.teamType, this.path);

  final String enumName;
  final String korean;
  final String path;
  final TeamType teamType;
}

enum TeamType {
  attack,
  defense;

  const TeamType();
}
