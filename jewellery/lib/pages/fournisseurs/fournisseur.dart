// ignore_for_file: non_constant_identifier_names, avoid_print
import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/pages/fournisseurs/show_fournisseur.dart';
import 'package:jewellery/pages/home/backend.dart';
import 'package:jewellery/widgets/style.dart';

import '../home/nombre_lignes.dart';

class Fournisseur {
  final int id_fournisseur;
  final String nom_fournisseur;
  final String ville;
  final String wilaya;
  final int id_titre;
  final String email;
  final String telephone;
  final String adresse;
  final Float solde;
  final Float total_or;
  final Float total_versement_or;
  final Float total_versement_argent;
  final Float total_perte;
  final Float total_retour_or;
  final Float total_retour_argent;
  final Float reste_or;
  final Float reste_argent;
  final String NRC;
  final String NIF;
  final String NIS;
  final String N_art;
  final bool is_deleted;
  final Float valeur;

  Fournisseur(
      {required this.id_fournisseur,
      required this.nom_fournisseur,
      required this.ville,
      required this.wilaya,
      required this.id_titre,
      required this.email,
      required this.telephone,
      required this.adresse,
      required this.solde,
      required this.total_or,
      required this.total_versement_or,
      required this.total_versement_argent,
      required this.total_perte,
      required this.total_retour_or,
      required this.total_retour_argent,
      required this.reste_or,
      required this.reste_argent,
      required this.NRC,
      required this.NIF,
      required this.NIS,
      required this.N_art,
      required this.is_deleted,
      required this.valeur});

  factory Fournisseur.fromJson(Map<String, dynamic> json) {
    return Fournisseur(
      id_fournisseur: json['id_fournisseur'],
      nom_fournisseur: json['nom_fournisseur'],
      ville: json['ville'],
      wilaya: json['wilaya'],
      id_titre: json['id_titre'],
      email: json['email'],
      telephone: json['telephone'],
      adresse: json['adresse'],
      solde: json['solde'],
      total_or: json['total_or'],
      total_versement_or: json['total_versement_or'],
      total_versement_argent: json['total_versement_argent'],
      total_perte: json['total_perte'],
      total_retour_or: json['total_retour_or'],
      total_retour_argent: json['total_retour_argent'],
      reste_or: json['reste_or'],
      reste_argent: json['reste_argent'],
      NRC: json['NRC'],
      NIF: json['NIF'],
      NIS: json['NIS'],
      N_art: json['N_art'],
      is_deleted: json['is_deleted'],
      valeur: json['valeur'],
    );
  }
}

class Fournisseurs extends StatefulWidget {
  const Fournisseurs({super.key});

  @override
  State<Fournisseurs> createState() => _FournisseursState();
}

class _FournisseursState extends State<Fournisseurs> {
  @override
  void initState() {
    super.initState();
  }

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
              FutureBuilder(
                  future: fetch_view_fournisseur(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(0, 36, 107, 1),
                        ),
                      );
                    } else {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('Vous n\'avez pas des fournisseurs'),
                        );
                      } else {
                        final data = snapshot.data!;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var item = data[index];
                                return FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child:
                                        makeItem(context: context, data: item));
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
    String nom = data['nom_fournisseur'];
    return Hero(
      tag: data['id_fournisseur'],
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowFournisseur(
                        data: data,
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
                            child: Text(
                              data['telephone'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
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
                  child: Text(
                    data['wilaya'] + ', ' + data['ville'],
                    style: const TextStyle(
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
