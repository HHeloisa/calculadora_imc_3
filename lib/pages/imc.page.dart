import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/models/register.model.dart';
import 'package:calculadora_imc_2/services.dart/sqlite.dart';
import 'package:calculadora_imc_2/widgets/custon_scaffold.dart';
import 'package:calculadora_imc_2/widgets/imc_history.widget.dart';
import 'package:calculadora_imc_2/widgets/user_form.dart';
import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  const IMCPage({super.key});

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  late List<RegisterModel> history;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustonScaffold(
      body: FutureBuilder<List<RegisterModel>>(
        future: getHistory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserForm(saveForm: saveForm),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Breakpoints.b8),
                  child: Divider(
                    thickness: 2,
                    color: Colors.purple,
                  ),
                ),
                HistoryIMC(
                  history: history,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  saveForm(pessoa) {
    SQLiteDataBase.salvar(pessoa);
    getHistory();
    setState(() {});
  }

  Future<List<RegisterModel>> getHistory() async {
    history = await SQLiteDataBase.obterDados();
    return history;
  }
}
