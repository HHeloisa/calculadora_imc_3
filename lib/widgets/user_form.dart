import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/models/pessoa.model.dart';
import 'package:calculadora_imc_2/models/register.model.dart';
import 'package:calculadora_imc_2/view_model/imc.view_model.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({required this.saveForm, super.key});

  final Function saveForm;
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // testeHive() async {
  //   var teste = await HiveService.handlePreferences(
  //       BoxNamesEnum.TESTE, HiveKeysEnum.NAME, HiveUpdateEnum.GET, null);
  //   var testinho;
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.purple),
            controller: _nameController,
            decoration: const InputDecoration(
                labelText: name, hintStyle: TextStyle(color: Colors.purple)),
            validator: (value) {
              if (value?.isEmpty != null && value!.isEmpty) {
                return insertName;
              }
              return null;
            },
          ),
          TextFormField(
            controller: _heightController,
            decoration: const InputDecoration(
                labelText: heigthCM,
                hintStyle: TextStyle(color: Colors.purple)),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty != null && value!.isEmpty) {
                return insertHeigth;
              }
              return null;
            },
          ),
          TextFormField(
            controller: _weightController,
            decoration: const InputDecoration(
                labelText: weigth, hintStyle: TextStyle(color: Colors.purple)),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value?.isEmpty != null && value!.isEmpty) {
                return insertWeigth;
              }

              return null;
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple)),
            child: const Text(calculate),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Future.delayed(const Duration(seconds: 1));
              var isValid = _formKey.currentState?.validate();
              if (isValid != null && isValid) {
                String nome = _nameController.text;
                double altura = double.parse(_heightController.text);
                double peso = double.parse(_weightController.text);
                Pessoa pessoa = Pessoa(nome, altura, peso);
                var imcRegistered = registerIMC(pessoa);
                if (imcRegistered == null) {
                  _nameController.clear();
                  _heightController.clear();
                  _weightController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(somethingWrong),
                  ));
                } else {
                  widget.saveForm(imcRegistered);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  RegisterModel? registerIMC(Pessoa pessoa) {
    double? imcResult = IMCViewModel().calcularIMC(pessoa);
    if (imcResult == null) return null;
    String imcCategoryResult = IMCViewModel().getIMCCategory(imcResult);

    return RegisterModel(
        name: pessoa.nome,
        altura: pessoa.altura,
        peso: pessoa.peso,
        imc: imcResult,
        category: imcCategoryResult);
  }
}
