// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class Client {
  final int id_client;
  final String nom_client;
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

  Client(
      {required this.id_client,
      required this.nom_client,
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

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id_client: json['id_client'],
      nom_client: json['nom_client'],
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_client'] = id_client;
    data['nom_client'] = nom_client;
    data['ville'] = ville;
    data['wilaya'] = wilaya;
    data['id_titre'] = id_titre;
    data['email'] = email;
    data['telephone'] = telephone;
    data['adresse'] = adresse;
    data['solde'] = solde;
    data['total_or'] = total_or;
    data['total_versement_or'] = total_versement_or;
    data['total_versement_argent'] = total_versement_argent;
    data['total_perte'] = total_perte;
    data['total_retour_or'] = total_retour_or;
    data['total_retour_argent'] = total_retour_argent;
    data['reste_or'] = reste_or;
    data['reste_argent'] = reste_argent;
    data['NRC'] = NRC;
    data['NIF'] = NIF;
    data['NIS'] = NIS;
    data['N_art'] = N_art;
    data['is_deleted'] = is_deleted;
    data['valeur'] = valeur;
    return data;
  }
}
