import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkings/controller/home_controller.dart';
import 'package:parkings/screens/actions_parkings.dart';
import 'package:parkings/screens/hourist_occupied.dart';
import 'package:parkings/screens/mounthly_occupied.dart';
import 'package:parkings/widgets/kings_container.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController
        .fetchData(context); // Passando o contexto para exibir SnackBars
  }

  Future<void> _refreshData() async {
    await homeController.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Estacionamento",
          style: TextStyle(
            color: Color(0xff191E26),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () => Get.to(ActScreen())!
                  .then((_) => homeController.fetchData(context)),
              child: Icon(
                Icons.add_rounded,
                color: Color(0xff191E26),
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vagas livres",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff191E26),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() {
                          if (homeController.data.isEmpty) {
                            return KingsContainer(
                              isOccuped: false,
                              isHourist: true,
                              qtd: "loading...",
                            );
                          } else {
                            final data = homeController.data;
                            return KingsContainer(
                              isOccuped: false,
                              isHourist: true,
                              qtd: data['vagasHoristasLivre'].toString(),
                            );
                          }
                        }),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Obx(() {
                          if (homeController.data.isEmpty) {
                            return KingsContainer(
                              isOccuped: false,
                              isHourist: true,
                              qtd: "loading...",
                            );
                          } else {
                            final data = homeController.data;
                            return KingsContainer(
                              isOccuped: false,
                              isHourist: false,
                              qtd: data['vagasMensalistasLivre'].toString(),
                            );
                          }
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vagas ocupadas",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff191E26),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() {
                          if (homeController.data.isEmpty) {
                            return KingsContainer(
                              isOccuped: false,
                              isHourist: true,
                              qtd: "loading...",
                            );
                          } else {
                            final data = homeController.data;
                            return KingsContainer(
                              isOccuped: true,
                              isHourist: true,
                              qtd: data['vagasHoristasPreenchida'].toString(),
                            );
                          }
                        }),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Obx(() {
                          if (homeController.data.isEmpty) {
                            return KingsContainer(
                              isOccuped: false,
                              isHourist: true,
                              qtd: "loading...",
                            );
                          } else {
                            final data = homeController.data;
                            return KingsContainer(
                              isOccuped: true,
                              isHourist: false,
                              qtd:
                                  data['vagasMensalistasPreenchida'].toString(),
                            );
                          }
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Vagas ocupadas",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff191E26),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(HouristsOccupieds())!
                              .then((_) => homeController.fetchData(context)),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF2A74F7),
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.alarm, color: Colors.white),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Vagas de Horista",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(MounthlyOccupied())!
                              .then((_) => homeController.fetchData(context)),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF28D5E2),
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month,
                                        color: Colors.black),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Vagas de Mensalista",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
