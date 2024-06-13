import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/helpers.dart';

Future<void> registrarEntradaHorista(BuildContext context, String placa) async {
  final url = Uri.parse('${Helpers.host}/registrar-entrada-horista');

  try {
    final response = await http.post(
      url,
      body: placa,
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Entrada de horista registrada com sucesso!'),
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
          content: Text('Erro ao registrar entrada de horista: $errorMessage'),
          duration: const Duration(seconds: 15),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ocorreu um erro inesperado: $e'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
