import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:flutter/material.dart';

class LabelH2 extends StatelessWidget {
  const LabelH2({super.key, required this.label, this.color});

  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        softWrap: true,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: Breakpoints.b16,
            color: color ?? Colors.black,
            fontWeight: FontWeight.w500));
  }
}
