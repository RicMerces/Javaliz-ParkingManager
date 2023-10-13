import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActScreen extends StatelessWidget {
  const ActScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ações",
          style: TextStyle(
            color: Color(0xff191E26),
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFBFF0FF),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Criar Horista",
                    style: TextStyle(
                        color: Color(0xff2A74F7), fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff2A74F7),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFBFF0FF),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Criar Mensalista",
                    style: TextStyle(
                        color: Color(0xff2A74F7), fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff2A74F7),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFBFF0FF),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Inserir mensalista em uma vaga",
                    style: TextStyle(
                        color: Color(0xff2A74F7), fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff2A74F7),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFBFF0FF),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Listar mensalistas criados",
                    style: TextStyle(
                        color: Color(0xff2A74F7), fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff2A74F7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
