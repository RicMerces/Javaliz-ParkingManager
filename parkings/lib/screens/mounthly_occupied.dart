import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkings/widgets/container_mensalista.dart';

import '../controller/mensalista_estacionado_controller.dart';

class MounthlyOccupied extends StatefulWidget {
  const MounthlyOccupied({Key? key}) : super(key: key);

  @override
  State<MounthlyOccupied> createState() => _MounthlyOccupiedState();
}

class _MounthlyOccupiedState extends State<MounthlyOccupied> {
  final MensalistasEstacionadosController mensalistaController =
      Get.put(MensalistasEstacionadosController());

  @override
  void initState() {
    super.initState();
    mensalistaController.fetchMensalistasEstacionados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Estacionamento",
          style: TextStyle(
            color: Color(0xff191E26),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Veja vagas ocupadas de Mensalistas",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff191E26),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(() {
              final mensalistaEstacionados =
                  mensalistaController.mensalistasEstacionados;

              if (mensalistaEstacionados.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const Center(
                    child: Text("Nenhum Horista foi encontrado estacionado"),
                  ),
                );
              } else {
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mensalistaEstacionados.length,
                      itemBuilder: (BuildContext context, int index) {
                        final mensalista = mensalistaEstacionados[index];
                        return ContainerMensalista(
                          cpf: mensalista['cpf'],
                          horista: mensalista['dataHoraEntrada'],
                          placa: mensalista['placa'],
                          id: index,
                          delete: () =>
                              mensalistaController.registrarSaidaMensalista(
                            mensalista['cpf'],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
