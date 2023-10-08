import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:flutter/material.dart';

class LabelH1 extends StatelessWidget {
  const LabelH1({super.key, required this.label, this.color});

  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
            fontSize: Breakpoints.b24,
            color: color ?? Colors.purple[800],
            fontWeight: FontWeight.w500));
  }
}
