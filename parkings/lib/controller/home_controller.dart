import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/helpers.dart';

class HomeController extends GetxController {
  var data = {}.obs;

  Future<void> fetchData(BuildContext context) async {
    try {
      final response =
          await http.get(Uri.parse('${Helpers.host}/situacao-vagas'));

      if (response.statusCode == 200) {
        data.value = json.decode(response.body);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro na solicitação: ${response.statusCode}'),
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
