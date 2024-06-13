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

  Future<void> _refreshData() async {
    await mensalistaController.fetchMensalistasEstacionados();
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
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Veja vagas ocupadas de Mensalistas",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff191E26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  final mensalistasEstacionados =
                      mensalistaController.mensalistasEstacionados;

                  if (mensalistasEstacionados.isEmpty) {
                    return const Center(
                      child:
                          Text("Nenhum Mensalista foi encontrado estacionado"),
                    );
                  } else {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: mensalistasEstacionados.length,
                      itemBuilder: (BuildContext context, int index) {
                        final mensalista = mensalistasEstacionados[index];
                        return ContainerMensalista(
                          cpf: mensalista['cpf'],
                          horista: mensalista['dataHoraEntrada'],
                          placa: mensalista['placa'],
                          id: index,
                          delete: () async {
                            await mensalistaController
                                .registrarSaidaMensalista(mensalista['cpf']);
                            await _refreshData();
                          },
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
