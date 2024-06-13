import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:parkings/utils/helpers.dart';

class HoristasEstacionadosController extends GetxController {
  var horistasEstacionados = <Map<String, dynamic>>[].obs;

  Future<void> fetchHoristasEstacionados() async {
    final response = await http
        .get(Uri.parse('${Helpers.host}/trazer-horistas-estacionados'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      horistasEstacionados
          .assignAll(data.map((e) => e as Map<String, dynamic>));
      print(response.body);
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }

  Future<void> registrarSaidaHorista(String placa) async {
    try {
      final response = await http
          .patch(Uri.parse('${Helpers.host}/registrar-saida-horista/$placa'));

      if (response.statusCode == 200) {
        final responseMessage = response.body;
        Get.dialog(
          Dialog(
            insetPadding: const EdgeInsets.all(30),
            child: Container(
              color: Colors.red,
              child: Text(responseMessage),
            ),
          ),
        );
        print(response.body);
      } else {
        throw Exception('Erro na solicitação: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao fazer a chamada HTTP: $error');
    }
  }

  Future<void> registrarSaidaMensalista(String placa) async {
    try {
      final url =
          Uri.parse('${Helpers.host}/registrar-saida-mensalista/$placa');
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
