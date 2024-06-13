import 'package:flutter/material.dart';

class ContainerMensalista extends StatelessWidget {
  const ContainerMensalista({
    Key? key,
    required this.placa,
    required this.horista,
    required this.cpf,
    required this.id,
    required this.delete,
  }) : super(key: key);

  final String placa;
  final String cpf;
  final String horista;
  final int id;
  final Function delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff28D5E2), borderRadius: BorderRadius.circular(5)),
      height: 150,
      padding: EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cpf,
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: () => delete(),
                child: Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                horista,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                placa,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                "VAGA${id + 1}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
