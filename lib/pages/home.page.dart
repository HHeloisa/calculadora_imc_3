import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/widgets/custom_app_bar.dart';
import 'package:calculadora_imc_2/widgets/label_h1.dart';
import 'package:calculadora_imc_2/widgets/navigation_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<String> explanationIMClist = [omsAboutIMC1, omsAboutIMC2, omsAboutIMC3];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: widget.title),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Breakpoints.b24, horizontal: Breakpoints.b8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                    color: Colors.purple[800],
                    elevation: 10,
                    child: const Padding(
                      padding: EdgeInsets.all(Breakpoints.b8),
                      child: LabelH1(label: homeTitle, color: Colors.white),
                    )),
                const SizedBox(height: Breakpoints.b16),
                // Utiizada a bilbioteca sugerida no forum do bootcamp
                // https://web.dio.me/topics/como-criar-um-carrossel-de-imagens-no-flutter?back=%2Ftrack%2Fsantander-bootcamp-2023-mobile-com-flutter&order=undefined&page=1&search=&tab=forum&track_id=5de8e6aa-4fa2-4954-9279-ff8faf1ae805
                CarouselSlider(
                  items: [
                    ExplanationCard(text: explanationIMClist[0]),
                    ExplanationCard(text: explanationIMClist[1]),
                    ExplanationCard(text: explanationIMClist[2]),
                  ],
                  options: CarouselOptions(
                    height: 500.0,
                    aspectRatio: 26,
                    enableInfiniteScroll: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: NavigationButton(
          texto: whannaKnow,
          funcao: () => {Navigator.pushNamed(context, '/input_data')},
        ),
      ),
    );
  }
}

class ExplanationCard extends StatelessWidget {
  const ExplanationCard({required this.text, super.key});

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
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
