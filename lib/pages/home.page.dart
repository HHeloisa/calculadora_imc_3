import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/widgets/carousel_card.widget.dart';
// import 'package:calculadora_imc_2/services.dart/hive.service.dart';
import 'package:calculadora_imc_2/widgets/custon_scaffold.dart';
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
    return CustonScaffold(
      backgroundColor: Colors.purple[100],
      showDrawer: false,
      appBarTitle: widget.title,
      removePadding: true,
      body: SingleChildScrollView(
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
                CarouselCard(text: explanationIMClist[0]),
                CarouselCard(text: explanationIMClist[1]),
                CarouselCard(text: explanationIMClist[2]),
              ],
              options: CarouselOptions(
                height: 500.0,
                viewportFraction: 0.95,
                aspectRatio: 1,
                enableInfiniteScroll: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: NavigationButton(
        texto: whannaKnow,
        funcao: () async {
          // HiveService.handlePreferences(BoxNamesEnum.TESTE, HiveKeysEnum.NAME,
          //     HiveUpdateEnum.PUT, {"superteste": "teste"});
          Navigator.pushNamed(context, '/imc');
        },
      ),
    );
  }
}
