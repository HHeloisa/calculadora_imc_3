import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/widgets/custon_app_bar.dart';
import 'package:calculadora_imc_2/widgets/label_h3.dart';
import 'package:calculadora_imc_2/widgets/navigation_button.dart';
import 'package:calculadora_imc_2/widgets/title_description.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const CustonAppBar(title: aboutMe),
          body: Padding(
              padding: const EdgeInsets.all(Breakpoints.b16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TitleDescription(
                    titulo: about,
                    descricao: aboutDescription,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: Breakpoints.b24),
                    child: LabelH3(label: myName),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: Breakpoints.b24),
                    child: LabelH3(label: contact),
                  ),
                  Center(
                    child: NavigationButton(
                      texto: backToHome,
                      funcao: () => {Navigator.pushNamed(context, '/')},
                    ),
                  ),
                ],
              ))),
    );
  }
}
