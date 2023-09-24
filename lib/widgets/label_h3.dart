import 'package:flutter/material.dart';

class LabelH3 extends StatelessWidget {
  const LabelH3({super.key, required this.instrucao});

  final String instrucao;
  @override
  Widget build(BuildContext context) {
    return Text(instrucao,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400));
  }
}
