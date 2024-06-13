import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:parkings/utils/helpers.dart';

class MensalistasEstacionadosController extends GetxController {
  var mensalistasEstacionados = <Map<String, dynamic>>[].obs;

  Future<void> fetchMensalistasEstacionados() async {
    final response = await http
        .get(Uri.parse('${Helpers.host}/trazer-mensalistas-estacionados'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      if (responseData is List) {
        mensalistasEstacionados.value =
            responseData.cast<Map<String, dynamic>>();
      } else {
        print("A resposta não é uma lista de objetos JSON.");
      }
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }

  Future<void> registrarSaidaMensalista(String cpf) async {
    try {
      final url = Uri.parse('${Helpers.host}/registrar-saida-mensalista/$cpf');
      final response = await http.patch(url);

      if (response.statusCode == 200) {
        print('Saída de mensalista registrada com sucesso!');
      } else {
        throw Exception(
            'Erro ao registrar saída de mensalista: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao fazer a chamada HTTP: $error');
    }
  }
}
