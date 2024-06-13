import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/mensalista_estacionado_controller.dart';

class MensalistasEstacionadosList extends StatefulWidget {
  @override
  _MensalistasEstacionadosListState createState() =>
      _MensalistasEstacionadosListState();
}

class _MensalistasEstacionadosListState
    extends State<MensalistasEstacionadosList> {
  final MensalistasEstacionadosController mensalistasController =
      Get.put(MensalistasEstacionadosController());

  @override
  void initState() {
    super.initState();
    mensalistasController.fetchMensalistasEstacionados();
  }

  Future<void> _refreshData() async {
    await mensalistasController.fetchMensalistasEstacionados();
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
          "Mensalistas Estacionados",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(
          () {
            final mensalistasEstacionados =
                mensalistasController.mensalistasEstacionados;

            if (mensalistasEstacionados.isEmpty) {
              return Center(
                child: Text("Nenhum mensalista está estacionado no momento."),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mensalistasEstacionados.length,
                  itemBuilder: (BuildContext context, int index) {
                    final mensalista = mensalistasEstacionados[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xffBFF0FF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 150,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CPF: ${mensalista['cpf']}",
                            style: TextStyle(
                              color: Color(0xff2A74F7),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              await mensalistasController
                                  .registrarSaidaMensalista(mensalista['cpf']);
                              await _refreshData();
                            },
                            child: Text("Registrar Saída"),
                          ),
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
      ),
    );
  }
}
