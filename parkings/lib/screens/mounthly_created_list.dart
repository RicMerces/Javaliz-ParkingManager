import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/lista_mensalistas_controller.dart';

class MounthlyCreatedList extends StatefulWidget {
  @override
  State<MounthlyCreatedList> createState() => _MounthlyCreatedListState();
}

class _MounthlyCreatedListState extends State<MounthlyCreatedList> {
  final MensalistasCriadosController mensalistasController =
      Get.put(MensalistasCriadosController());

  @override
  void initState() {
    super.initState();
    mensalistasController.fetchMensalistasCriados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Mensalistas criados",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () {
          final mensalistasCriados = mensalistasController.mensalistasCriados;

          if (mensalistasCriados.isEmpty) {
            return Center(
              child: Text("Nenhum mensalista foi criado ainda."),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mensalistasCriados.length,
                itemBuilder: (BuildContext context, int index) {
                  final mensalista = mensalistasCriados[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffBFF0FF),
                        borderRadius: BorderRadius.circular(5)),
                    height: 150,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CPF: ${mensalista.cpf}",
                          style: TextStyle(
                            color: Color(0xff2A74F7),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Adicione outros campos do mensalista aqui, por exemplo:
                        // Text("Nome: ${mensalista['nome']}"),
                        // Text("Telefone: ${mensalista['tel']}"),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
