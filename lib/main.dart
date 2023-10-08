import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/pages/about.page.dart';
import 'package:calculadora_imc_2/pages/home.page.dart';
import 'package:calculadora_imc_2/pages/imc.page.dart';
import 'package:calculadora_imc_2/services.dart/sqlite.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Preciso do path provider para utilizar o Hive
  // var documentsDirectory =
  //     await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(documentsDirectory.path);

  /// iniciando o sqlite
  await SQLiteDataBase().obterDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: projectTitle,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(title: projectTitle),
      initialRoute: '/',
      routes: {
        '/about': (context) => const AboutPage(),
        '/imc': (context) => const IMCPage(),
      },
    );
  }
}
