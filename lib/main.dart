import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/pages/about.page.dart';
import 'package:calculadora_imc_2/pages/home.page.dart';
import 'package:calculadora_imc_2/pages/input_data.page.dart';
import 'package:calculadora_imc_2/pages/result.page.dart';
import 'package:flutter/material.dart';

void main() {
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
        '/input_data': (context) => const InputDataPage(),
        '/result': (context) => const ResultPage(),
      },
    );
  }
}
