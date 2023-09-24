import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/widgets/label_h1.dart';
import 'package:calculadora_imc_2/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription(
      {super.key, required this.titulo, required this.descricao});

  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Padding(
            padding: const EdgeInsets.only(bottom: Breakpoints.b16),
            child: LabelH1(label: titulo)),
      ),
      LabelH2(label: descricao),
    ]);
  }
}
