import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/mensalistas_criados.dart';
import '../utils/helpers.dart';

class MensalistasCriadosController extends GetxController {
  final mensalistasCriados = <MensalistaCriado>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMensalistasCriados();
  }

  Future<void> fetchMensalistasCriados() async {
    try {
      final response = await http.get(
        Uri.parse('${Helpers.host}/trazer-mensalistas-criados'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        mensalistasCriados.assignAll(data
            .map((item) => MensalistaCriado(
                  id: item['id'],
                  cpf: item['cpf'],
                ))
            .toList());
      } else {
        throw Exception(
            'Erro ao buscar mensalistas criados: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao fazer a chamada HTTP: $error');
    }
  }
}
