import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/models/pessoamodel..dart';
import 'package:calculadora_imc_2/view_model/imc.view_model.dart';
import 'package:calculadora_imc_2/widgets/custom_app_bar.dart';
import 'package:calculadora_imc_2/widgets/label_h1.dart';
import 'package:calculadora_imc_2/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final Pessoa? args = ModalRoute.of(context)?.settings.arguments as Pessoa?;
    final Pessoa? pessoa = args;
    final IMCViewModel imcViewModel = IMCViewModel();

    IMCResult? imcResult =
        pessoa != null ? IMCViewModel().calcularIMC(pessoa) : null;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Breakpoints.b24, horizontal: Breakpoints.b24),
            child: pessoa != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                            color: Colors.purple[800],
                            elevation: 10,
                            child: const Padding(
                              padding: EdgeInsets.all(Breakpoints.b8),
                              child:
                                  LabelH1(label: result, color: Colors.white),
                            )),
                      ),
                      const SizedBox(height: Breakpoints.b24),
                      Expanded(
                        child: ListView.builder(
                            itemCount: imcValues.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Breakpoints.b8),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LabelH2(
                                        label: imcValues[index],
                                        color: Colors.purple,
                                      ),
                                      Expanded(child: Container()),
                                      LabelH2(label: categoryValues[index])
                                    ]),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: Breakpoints.b24,
                      ),
                      Expanded(
                        flex: 2,
                        child: LabelH1(
                          label: imcViewModel.getMessageResult(
                              imcResult!.imc, imcResult.imcCategoryDefinition),
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator()),
      ),
    );
  }
}

List<String> imcValues = [
  "< 16,5",
  "16,5 - 18,5",
  "18,5 – 24,99",
  "25 – 29,99",
  "30 – 34,99",
  "35 – 39,99",
  "> 40",
];
List<String> categoryValues = [
  "Peso severamente abaixo do normal",
  "Peso abaixo do normal",
  "Normal",
  "Pré-obeso",
  "Obesidade classe I",
  "Obesidade classe II",
  "Obesidade classe III"
];
