class RegisterModel {
  RegisterModel(
      {this.id,
      required this.name,
      required this.peso,
      required this.altura,
      required this.imc,
      required this.category});

  final int? id;
  final String name;
  final double altura;
  final double peso;
  final double imc;
  final String category;
}
