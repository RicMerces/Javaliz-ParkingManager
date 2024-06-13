import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/horista_estacionado_controller.dart';
import '../widgets/container_horista.dart';

class HouristsOccupieds extends StatefulWidget {
  const HouristsOccupieds({Key? key}) : super(key: key);

  @override
  State<HouristsOccupieds> createState() => _HouristsOccupiedsState();
}

class _HouristsOccupiedsState extends State<HouristsOccupieds> {
  final HoristasEstacionadosController horistasController =
      Get.put(HoristasEstacionadosController());

  @override
  void initState() {
    super.initState();
    horistasController.fetchHoristasEstacionados();
  }

  Future<void> _refreshData() async {
    await horistasController.fetchHoristasEstacionados();
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
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Veja vagas ocupadas de Horistas",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff191E26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  final horistasEstacionados =
                      horistasController.horistasEstacionados;

                  if (horistasEstacionados.isEmpty) {
                    return const Center(
                      child: Text("Nenhum Horista foi encontrado estacionado"),
                    );
                  } else {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: horistasEstacionados.length,
                      itemBuilder: (BuildContext context, int index) {
                        final horista = horistasEstacionados[index];
                        return ContainerHorista(
                          isHourist: horista['isHorista'],
                          delete: () async {
                            await horistasController
                                .registrarSaidaHorista(horista['placa']);
                            await _refreshData();
                          },
                          horista: horista['dataHoraEntrada'],
                          placa: horista['placa'],
                          id: index,
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
