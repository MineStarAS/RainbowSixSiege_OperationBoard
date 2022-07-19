// ignore_for_file: file_names, constant_identifier_names

enum Floor {
  F4("4F"),
  F3("3F"),
  F2("2F"),
  F1("1F"),
  B1("B1"),
  B2("B2"),
  ;
  const Floor(this.string);
  final String string;
}