// ignore_for_file: unnecessary_getters_setters

import 'package:hive/hive.dart';

// Para o hive é necessário adicionar:
// part 'pessoa.model.g.dart';
//  que irá permanecer como errado até que rode o comando:
// flutter pub run build_runner build
// de forma a gerar o model automaticamente, com o hive

/// Extendo o módulo como um objecto hive para que posso ser]
/// Chave única, necessario para o posicionamento dos objetos guardados
@HiveType(typeId: 0)
class Pessoa extends HiveObject {
  // int id;

  /// Model utilizando o huve, tambbém necessario definir o id da propriedade
  @HiveField(0)
  String _nome;
  @HiveField(1)
  double _altura;
  @HiveField(2)
  double _peso;
  @HiveField(3)
  double? _imc;
  @HiveField(4)
  String? _imcCategory;

  Pessoa(
      // this.id,
      this._nome,
      this._altura,
      this._peso);

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
