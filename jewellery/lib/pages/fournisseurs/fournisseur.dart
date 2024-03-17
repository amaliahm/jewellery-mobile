import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/pages/fournisseurs/show_fournisseur.dart';
import 'package:jewellery/widgets/style.dart';

import '../home/nombre_lignes.dart';

class Fournisseurs extends StatefulWidget {
  const Fournisseurs({super.key});

  @override
  State<Fournisseurs> createState() => _FournisseursState();
}

class _FournisseursState extends State<Fournisseurs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: const Center(
          child: Text(
            "Les Fournisseurs",
            style: TextStyle(color: AppTheme.darkText, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: makeItem(context: context)),
              FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: makeItem(context: context)),
              FadeInUp(
                  duration: const Duration(milliseconds: 1700),
                  child: makeItem(context: context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({context}) {
    String nom = 'Nom';
    return Hero(
      tag: 'tag',
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowFournisseur(
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
                            child: Image.asset('assets/icons/fournisseur.png'),
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
