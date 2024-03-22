// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../home/nombre_lignes.dart';

class ShowClient extends StatefulWidget {
  final data;

  const ShowClient({Key? key, required this.data}) : super(key: key);

  @override
  _ShowElementState createState() => _ShowElementState();
}

class _ShowElementState extends State<ShowClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: widget.data['id_client'],
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
                                  widget.data['nom_client'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )),
                            section(nom: 'informations'),
                            element(
                                duration: 1500,
                                valeur: "Titre: ${widget.data['valeur']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "NRC: ${widget.data['NRC'] ?? widget.data['NRC']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "NRC: ${widget.data['NIF'] ?? widget.data['NIF']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "NIS: ${widget.data['NIS'] ?? widget.data['NIS']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "N=° d'article: ${widget.data['N_art'] ?? widget.data['N_art']}"),
                            section(nom: 'cordonnées'),
                            element(
                                duration: 1500,
                                valeur: "Ville: ${widget.data['ville']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur: "Wilaya: ${widget.data['wilaya']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "Adresse: ${widget.data['adresse'] == null ? widget.data['adresse'] : ''}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "Email: ${widget.data['email'] == null ? widget.data['email'] : ''}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "Telephone: ${widget.data['telephone']}"),
                            section(nom: 'compte'),
                            element(
                                duration: 1500,
                                valeur: "Solde: ${widget.data['solde']} \$"),
                            line(),
                            element(
                                duration: 1500,
                                valeur: "Or: ${widget.data['total_or']}"),
                            section(nom: 'versement'),
                            element(
                                duration: 1500,
                                valeur:
                                    "Or: ${widget.data['total_versement_or']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "Argent: ${widget.data['total_versement_argent']} \$"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "Total perte: ${widget.data['total_perte']}"),
                            section(nom: 'retour'),
                            element(
                                duration: 1500,
                                valeur:
                                    "or: ${widget.data['total_retour_or']}"),
                            line(),
                            element(
                                duration: 1500,
                                valeur:
                                    "argent: ${widget.data['total_retour_argent']} \$"),
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

  Widget element({valeur, duration}) {
    return FadeInUp(
        duration: Duration(milliseconds: duration),
        child: Text(
          valeur,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));
  }

  Widget line() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 33, bottom: 33),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3F8).withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }

  Widget section({nom}) {
    return FadeInUp(
        duration: const Duration(milliseconds: 2000),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
              nom,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ));
  }
}
