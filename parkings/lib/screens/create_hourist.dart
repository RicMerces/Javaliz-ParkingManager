import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:parkings/widgets/blue_form_field.dart';
import 'package:parkings/widgets/park_btn.dart';
import '../controller/criar_horista_controller.dart';

class CreateHourist extends StatefulWidget {
  const CreateHourist({Key? key}) : super(key: key);

  @override
  State<CreateHourist> createState() => _CreateHouristState();
}

class _CreateHouristState extends State<CreateHourist> {
  final MaskedTextController controller =
      MaskedTextController(mask: 'AAA-0000');
  final ValueNotifier<bool> isFormValid = ValueNotifier<bool>(false);

  void validateForm() {
    isFormValid.value = controller.text.length == 8;
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(validateForm);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void registrarEntrada() {
    if (isFormValid.value) {
      registrarEntradaHorista(context, controller.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Formato de placa inválido. Insira no formato AAA-1234.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

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
                      const SizedBox(height: 5),
                      Text("Vamos inseri-lo em uma vaga"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BlueFormField(
                  controller: controller,
                  labelTitle: "Placa do Horista",
                  labelText: "EX: AAA-1234",
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isFormValid,
              builder: (context, isValid, child) {
                return ParkBtn(
                  title: "Cadastrar",
                  onPressed: isValid ? registrarEntrada : () {},
                  isEnabled: isValid,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
