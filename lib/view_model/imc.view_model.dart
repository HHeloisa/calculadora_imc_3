import 'dart:math';

import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/models/pessoa.model.dart';

import '../models/imc.model.dart';

class IMCViewModel {
  IMC? userData;
  String? imcCategoryDefinition;
  double? imc;

  double? calcularIMC(Pessoa pessoa) {
    userData = IMC(altura: pessoa.altura, peso: pessoa.peso);
    var alturaMetros = pessoa.altura / 100;

    var imcFixed = (pessoa.peso / pow(alturaMetros, 2)).toStringAsFixed(2);
    imc = double.parse(imcFixed);
    return imc;
  }

  getIMCCategory(double imc) {
    if (imc < 16.5) {
      return imcCategory1;
    } else if (imc > 16.5 && imc < 18.5) {
      return imcCategory2;
    } else if (imc >= 18.5 && imc < 24.9) {
      return imcCategory3;
    } else if (imc >= 24.9 && imc < 29.9) {
      return imcCategory4;
    } else if (imc >= 30 && imc < 34.99) {
      return imcCategory5;
    } else if (imc >= 35 && imc < 39.9) {
      return imcCategory6;
    } else {
      return imcCategory7;
    }
  }

  String getMessageResult(imc, imcCategoryDefinition) {
    return "Seu IMC é $imc e está classificado como: $imcCategoryDefinition";
  }
}

class IMCResult {
  const IMCResult(this.imc, this.imcCategoryDefinition);
  final double imc;
  final String imcCategoryDefinition;
}
