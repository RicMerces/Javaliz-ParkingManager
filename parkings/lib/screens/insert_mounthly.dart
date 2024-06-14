import 'package:flutter/material.dart';
import 'package:parkings/widgets/park_btn.dart';
import 'package:parkings/widgets/blue_form_field.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../controller/entrada_mensalista.dart';

class InsertMounthly extends StatefulWidget {
  const InsertMounthly({Key? key}) : super(key: key);

  @override
  State<InsertMounthly> createState() => _InsertMounthlyState();
}

class _InsertMounthlyState extends State<InsertMounthly> {
  final MaskedTextController controller =
      MaskedTextController(mask: '000.000.000-00');
  final EntradaMensalistaController entradaMensalistaController =
      EntradaMensalistaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Inserir mensalista",
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
                        "Preencha o campo abaixo com o CPF do mensalista",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Vamos inseri-lo em uma vaga"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                BlueFormField(
                  controller: controller,
                  labelTitle: "CPF",
                  labelText: "EX: 999.888.777-66",
                ),
              ],
            ),
            ParkBtn(
              title: "Inserir",
              onPressed: () {
                if (controller.text.length == 14) {
                  // Verifica se o CPF está completamente preenchido
                  entradaMensalistaController.registrarEntradaMensalista(
                      context, controller.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Por favor, preencha o CPF completamente."),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
