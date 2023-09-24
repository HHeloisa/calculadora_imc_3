// ignore_for_file: unnecessary_getters_setters

class Pessoa {
  String _nome;
  double _altura;
  double _peso;
  double? _imc;
  String? _imcCategory;

  Pessoa(this._nome, this._altura, this._peso);

  // Getter para o nome
  String get nome => _nome;

  // Setter para o nome
  set nome(String novoNome) {
    _nome = novoNome;
  }

  // Getter para o peso
  double get peso => _peso;

  // Setter para o peso
  set peso(double novoPeso) {
    _peso = novoPeso;
  }

  // Getter para a altura
  double get altura => _altura;

  // Setter para a altura
  set altura(double novaAltura) {
    _altura = novaAltura;
  }

  // Getter para o imc
  double? get imc => _imc;

  // Setter para o nome
  set imc(double? imc) {
    _imc = imc;
  }

  // Getter para a categoria imc
  String? get imcCategory => _imcCategory;

  // Setter para o nome
  set imcCategory(String? imcCategory) {
    _imcCategory = imcCategory;
  }

  @override
  String toString() {
    return {
      "Nome": nome,
      "Altura": altura,
      "Peso": peso,
      "IMC": imc,
      "Categoria do IMC": imcCategory
    }.toString();
  }
}
