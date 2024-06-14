import 'dart:convert';
import 'package:flutter/material.dart';
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
        Get.dialog(
          Dialog(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff28D5E2),
              ),
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mensalista saindo da vaga",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "CPF do Mensalista : " + cpf,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        throw Exception(
            'Erro ao registrar saída de mensalista: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao fazer a chamada HTTP: $error');
    }
  }
}
