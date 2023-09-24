import 'package:calculadora_imc_2/constants/string.dart';
import 'package:calculadora_imc_2/models/pessoamodel..dart';
import 'package:calculadora_imc_2/view_model/imc.view_model.dart';
import 'package:calculadora_imc_2/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InputDataPage extends StatelessWidget {
  const InputDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(title: userRegister), body: UserForm()));
  }
}

class UserForm extends StatefulWidget {
  const UserForm({super.key});

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
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value?.isEmpty != null && value!.isEmpty) {
                return 'Por favor, insira um nome';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _heightController,
            decoration: const InputDecoration(labelText: 'Altura (cm)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value?.isEmpty != null && value!.isEmpty) {
                return 'Por favor, insira uma altura';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _weightController,
            decoration: const InputDecoration(labelText: 'Peso (kg)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value?.isEmpty != null && value!.isEmpty) {
                return 'Por favor, insira um peso';
              }
              if (IMCViewModel.contemLetra(value!)) {
                return onlyNumbersException;
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
            child: const Text('Enviar'),
            onPressed: () {
              Future.delayed(const Duration(seconds: 1));
              var isValid = _formKey.currentState?.validate();
              if (isValid != null && isValid) {
                String nome = _nameController.text;
                double altura = double.parse(_heightController.text);
                double peso = double.parse(_weightController.text);

                Pessoa pessoa = Pessoa(nome, altura, peso);

                Navigator.pushNamed(context, '/result', arguments: pessoa);
              }
            },
          ),
        ],
      ),
    );
  }
}
