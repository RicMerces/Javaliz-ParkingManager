import 'package:flutter/material.dart';
import 'package:parkings/controller/criar_horista_controller.dart';
import 'package:parkings/widgets/blue_form_field.dart';
import 'package:parkings/widgets/park_btn.dart';

class CreateHourist extends StatefulWidget {
  const CreateHourist({Key? key}) : super(key: key);

  @override
  State<CreateHourist> createState() => _CreateHouristState();
}

class _CreateHouristState extends State<CreateHourist> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Criar Horistas",
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
                        "Preencha o campo abaixo com a Placa do carro do Horista",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Vamos inseri-lo em uma vaga",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlueFormField(
                  controller: controller,
                  labelTitle: "Placa do Horista",
                  labelText: "EX: AAA-1234",
                ),
              ],
            ),
            ParkBtn(
              title: "Cadastrar",
              onPressed: () {
                registrarEntradaHorista(context, controller.text);
                print(controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
