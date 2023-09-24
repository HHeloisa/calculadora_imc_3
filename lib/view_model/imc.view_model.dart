import 'dart:math';

import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/models/pessoamodel..dart';

import '../models/imc.model.dart';

class IMCViewModel {
  IMC? userData;
  String? imcCategoryDefinition;
  double? imc;

  IMCResult? calcularIMC(Pessoa pessoa) {
    userData = IMC(altura: pessoa.altura, peso: pessoa.peso);
    var alturaMetros = pessoa.altura / 100;

    var imcFixed = (pessoa.peso / pow(alturaMetros, 2)).toStringAsFixed(2);
    imc = double.parse(imcFixed);
    return setImcInformations(imc!);
  }

  setImcInformations(double imc) {
    if (imc < 16.5) {
      imcCategoryDefinition = imcCategory1;
      return IMCResult(imc, imcCategoryDefinition!);
    } else if (imc > 16.5 && imc < 18.5) {
      imcCategoryDefinition = imcCategory2;
      return IMCResult(imc, imcCategoryDefinition!);
    } else if (imc >= 18.5 && imc < 24.9) {
      imcCategoryDefinition = imcCategory3;
      return IMCResult(imc, imcCategoryDefinition!);
    } else if (imc >= 24.9 && imc < 29.9) {
      imcCategoryDefinition = imcCategory4;
      return IMCResult(imc, imcCategoryDefinition!);
    } else if (imc >= 30 && imc < 34.99) {
      imcCategoryDefinition = imcCategory5;
      return IMCResult(imc, imcCategoryDefinition!);
    } else if (imc >= 35 && imc < 39.9) {
      imcCategoryDefinition = imcCategory6;
      return IMCResult(imc, imcCategoryDefinition!);
    } else {
      imcCategoryDefinition = imcCategory7;
      return IMCResult(imc, imcCategoryDefinition!);
    }
  }

  String getMessageResult(imc, imcCategoryDefinition) {
    return "Seu IMC é $imc e está classificado como: $imcCategoryDefinition";
  }

  static bool contemLetra(String texto) {
    return RegExp(r'[a-zA-Z]').hasMatch(texto);
  }
}

class IMCResult {
  const IMCResult(this.imc, this.imcCategoryDefinition);
  final double imc;
  final String imcCategoryDefinition;
}
