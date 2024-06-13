import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:parkings/models/mensalista.dart';
import '../utils/helpers.dart';

class MensalistaController extends GetxController {
  Future<void> createMensalista(
      BuildContext context, Mensalista mensalista) async {
    try {
      final response = await http.post(
        Uri.parse('${Helpers.host}/criar-mensalista'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(mensalista.toJson()),
      );

      print(mensalista.toJson().toString());

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Mensalista criado com sucesso!'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Decodifica a mensagem de erro do corpo da resposta JSON
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        final String errorMessage = errorResponse['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao criar mensalista: $errorMessage'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer a chamada HTTP: $error'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
