import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/pages/clients/show_client.dart';
import 'package:jewellery/pages/home/backend.dart';
import 'package:jewellery/widgets/style.dart';

import '../home/nombre_lignes.dart';

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  dynamic client;
  @override
  void initState() {
    client = fetch_view_client();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(client);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: const Center(
          child: Text(
            "Les Clients",
            style: TextStyle(color: AppTheme.darkText, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: client,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: Color.fromRGBO(0, 36, 107, 1),
                      );
                    } else {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('u have no clients'),
                        );
                      } else {
                        final data = snapshot.data!;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child:
                                        makeItem(context: context, data: data));
                              }),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({context, data}) {
    print(data[0]);
    String nom = 'nom';
    return Hero(
      tag: 'tag',
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowClient(
                        nom: nom,
                      )));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: HexColor('#FFB295'),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: const Offset(0, 10))
            ],
            // gradient: LinearGradient(
            //   colors: <HexColor>[
            //     HexColor('#FA7D82'),
            //     HexColor('#FFB295'),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInUp(
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              nom,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1100),
                            child: const Text(
                              "Telephone",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Center(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset('assets/icons/client.png'),
                          ),
                        ),
                      ))
                ],
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  child: const Text(
                    "Titre",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
