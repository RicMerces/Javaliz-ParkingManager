import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/criar_mensalista_controller.dart';
import '../models/mensalista.dart';
import '../models/placa.dart';
import '../widgets/blue_form_field.dart';
import '../widgets/park_btn.dart';

class CreateMounthly extends StatefulWidget {
  const CreateMounthly({Key? key}) : super(key: key);

  @override
  State<CreateMounthly> createState() => _CreateMounthlyState();
}

class _CreateMounthlyState extends State<CreateMounthly> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cpfController = TextEditingController();
    TextEditingController nomeController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();
    TextEditingController placasController = TextEditingController();
    final MensalistaController mensalistaController =
        Get.put(MensalistaController());
    void cadastrarMensalista() {
      final cpf = cpfController.text;
      final nome = nomeController.text;
      final telefone = telefoneController.text;
      final placas = placasController.text
          .split(',')
          .map((placa) => Placa(placa: placa.trim()))
          .toList();

      final mensalista =
          Mensalista(nome: nome, cpf: cpf, tel: telefone, placas: placas);

      mensalistaController.createMensalista(context, mensalista);
    }

    return Scaffold(
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
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
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
                        "Vamos inseri-lo em nosso banco com sua respectivas placas",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlueFormField(
                  controller: cpfController,
                  labelTitle: "CPF",
                  labelText: "EX: 999-888-777-66",
                ),
                BlueFormField(
                  controller: nomeController,
                  labelTitle: "Nome",
                  labelText: "EX: Fulano de Tal",
                ),
                BlueFormField(
                  controller: telefoneController,
                  labelTitle: "Telefone",
                  labelText: "EX: 71 98999-8888",
                ),
                BlueFormField(
                  controller: placasController,
                  labelTitle: "Placa(s)",
                  labelText: "EX: PLA-0001, CAA-0002, PLA-0003",
                ),
              ],
            ),
            ParkBtn(
              title: "Cadastrar",
              onPressed: () => cadastrarMensalista(),
            ),
          ],
        ),
      ),
    );
  }
}
