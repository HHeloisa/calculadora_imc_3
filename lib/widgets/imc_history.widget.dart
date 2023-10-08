import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/models/register.model.dart';
import 'package:calculadora_imc_2/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class HistoryIMC extends StatefulWidget {
  const HistoryIMC({required this.history, super.key});

  final List<RegisterModel> history;
  @override
  State<HistoryIMC> createState() => _HistoryIMCState();
}

class _HistoryIMCState extends State<HistoryIMC> {
  late List<String> usersList;
  late List<RegisterModel> userHistoryDisplay;
  late String selectedUser;

  @override
  void initState() {
    usersList = getUsersNames(widget.history);
    setHistoryForDisplay(widget.history, usersList[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: usersList.length,
            itemBuilder: (context, index) => Column(children: [
              TextButton(
                  onPressed: () {
                    setHistoryForDisplay(widget.history, usersList[index]);
                  },
                  child: Card(
                    color: usersList[index] == selectedUser
                        ? Colors.purple
                        : Colors.purple[200],
                    child: Padding(
                      padding: const EdgeInsets.all(Breakpoints.b8),
                      child: LabelH2(
                        label: usersList[index],
                        color: Colors.white,
                      ),
                    ),
                  )),
            ]),
          ),
        ),
        HistoryTable(history: userHistoryDisplay),
      ],
    );
  }

  List<String> getUsersNames(history) {
    List<String> usersNames = [];
    for (final register in history) {
      usersNames.contains(register.name) ? null : usersNames.add(register.name);
    }
    return usersNames;
  }

  void setHistoryForDisplay(history, user) {
    selectedUser = user;
    List<RegisterModel> userRegister = [];
    for (final register in history) {
      register.name == user ? userRegister.add(register) : null;
    }
    setState(() {
      userHistoryDisplay = userRegister;
    });
  }
}

class HistoryTable extends StatelessWidget {
  const HistoryTable({required this.history, super.key});

  final List<RegisterModel> history;
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: const [
          DataColumn(label: Text('Altura')),
          DataColumn(label: Text('Peso')),
          DataColumn(label: Text('IMC')),
          DataColumn(label: Text('Categoria')),
        ],
        rows: history.map((register) {
          return DataRow(
            cells: [
              DataCell(Text(register.altura.toString())),
              DataCell(Text(register.peso.toString())),
              DataCell(Text(register.imc.toString())),
              DataCell(Text(register.category)),
            ],
          );
        }).toList());
  }
}
