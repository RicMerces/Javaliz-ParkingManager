import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:parkings/widgets/blue_form_field.dart';
import 'package:parkings/widgets/park_btn.dart';
import '../controller/criar_mensalista_controller.dart';
import '../models/mensalista.dart';
import '../models/placa.dart';

class CreateMounthly extends StatefulWidget {
  const CreateMounthly({Key? key}) : super(key: key);

  @override
  State<CreateMounthly> createState() => _CreateMounthlyState();
}

class _CreateMounthlyState extends State<CreateMounthly> {
  final TextEditingController cpfController =
      MaskedTextController(mask: '000.000.000-00');
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController =
      MaskedTextController(mask: '(00) 00000-0000');
  final TextEditingController placaController =
      MaskedTextController(mask: 'AAA-0000');
  final MensalistaController mensalistaController =
      Get.put(MensalistaController());
  final List<String> placas = [];
  final ValueNotifier<bool> isFormValid = ValueNotifier<bool>(false);

  void cadastrarMensalista() {
    final cpf = cpfController.text;
    final nome = nomeController.text;
    final telefone = telefoneController.text;
    final placasList =
        placas.map((placa) => Placa(placa: placa.trim())).toList();

    final mensalista =
        Mensalista(nome: nome, cpf: cpf, tel: telefone, placas: placasList);
    mensalistaController.createMensalista(context, mensalista);
  }

  void addPlaca(String placa) {
    setState(() {
      placas.add(placa);
      placaController.clear();
      validateForm();
    });
  }

  void validateForm() {
    final isValid = cpfController.text.isNotEmpty &&
        nomeController.text.isNotEmpty &&
        telefoneController.text.isNotEmpty &&
        placas.isNotEmpty;
    isFormValid.value = isValid;
  }

  @override
  void initState() {
    super.initState();
    cpfController.addListener(validateForm);
    nomeController.addListener(validateForm);
    telefoneController.addListener(validateForm);
    placaController.addListener(validateForm);
  }

  @override
  void dispose() {
    cpfController.dispose();
    nomeController.dispose();
    telefoneController.dispose();
    placaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: isFormValid,
        builder: (context, isValid, child) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ParkBtn(
              title: "Cadastrar",
              onPressed: isValid ? cadastrarMensalista : () {},
              isEnabled: isValid,
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
        elevation: 0,
        title: const Text(
          "Criar Mensalista",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Preencha o campo abaixo com os dados do mensalista",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Vamos inseri-lo em nosso banco com suas respectivas placas",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlueFormField(
                    controller: cpfController,
                    labelTitle: "CPF",
                    labelText: "EX: 999.888.777-66",
                  ),
                  BlueFormField(
                    controller: nomeController,
                    labelTitle: "Nome",
                    labelText: "EX: Fulano de Tal",
                  ),
                  BlueFormField(
                    controller: telefoneController,
                    labelTitle: "Telefone",
                    labelText: "EX: (71) 98999-8888",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Placa(s)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: placas.map((placa) {
                            return Chip(
                              label: Text(placa),
                              onDeleted: () {
                                setState(() {
                                  placas.remove(placa);
                                  validateForm();
                                });
                              },
                            );
                          }).toList(),
                        ),
                        TextField(
                          controller: placaController,
                          decoration: InputDecoration(
                            labelText: "Adicionar Placa",
                            hintText: "EX: PLA-0001",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color(0xff2A74F7),
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color(0xff2A74F7),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              addPlaca(value);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
