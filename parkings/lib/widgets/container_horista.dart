import 'package:flutter/material.dart';

class ContainerHorista extends StatelessWidget {
  const ContainerHorista({
    Key? key,
    required this.placa,
    required this.horista,
    required this.id,
    required this.delete,
    this.isHourist = true,
  }) : super(key: key);

  final String placa;
  final String horista;
  final int id;
  final Function delete;
  final bool isHourist;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: !isHourist ? const Color(0xff2A74F7) : Color(0xff28D5E2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 150,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                horista,
                style: TextStyle(
                  color: !isHourist ? Colors.white : Color(0xff1C1B1F),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final result = await delete();
                  print(result);
                },
                child: Icon(
                  Icons.exit_to_app_rounded,
                  color: !isHourist ? Colors.white : Color(0xff1C1B1F),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            placa,
            style: TextStyle(
              color: !isHourist ? Colors.white : Color(0xff1C1B1F),
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            "VAGA${id + 1} ${isHourist ? "- Mensalista na vaga" : ""}",
            style: TextStyle(
              color: !isHourist ? Colors.white : Color(0xff1C1B1F),
            ),
          ),
        ],
      ),
    );
  }
}
