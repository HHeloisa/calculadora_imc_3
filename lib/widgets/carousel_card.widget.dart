import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/widgets/label_h1.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.purple[100]),
      child: Padding(
        padding: const EdgeInsets.all(Breakpoints.b8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Breakpoints.b32),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(Breakpoints.b24),
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: [
                  LabelH1(
                    label: text,
                    color: Colors.purple[800],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: Colors.purple[800]),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
