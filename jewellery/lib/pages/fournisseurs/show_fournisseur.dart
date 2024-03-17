import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../home/nombre_lignes.dart';

class ShowFournisseur extends StatefulWidget {
  final String nom;

  const ShowFournisseur({Key? key, required this.nom}) : super(key: key);

  @override
  _ShowElementState createState() => _ShowElementState();
}

class _ShowElementState extends State<ShowFournisseur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: 'tag',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: const Offset(0, 10))
          ]),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 800,
                child: FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: <HexColor>[
                          HexColor('#FA7D82'),
                          HexColor('#FFB295'),
                        ],
                      )),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1300),
                                child: Text(
                                  widget.nom,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1400),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1500),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1600),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1700),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1800),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: const Text(
                                  "Telephone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
