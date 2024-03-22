// ignore_for_file: avoid_print, constant_identifier_names, non_constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;

const API = 'http://192.168.43.136:3000/';

Future<List> fetch_view_client() async {
  final response = await http.get(Uri.parse(API));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['view_client'];
  } else {
    print('Failed to load data: ${response.statusCode}');
    return [];
  }
}

Future<List> fetch_view_fournisseur() async {
  final response = await http.get(Uri.parse(API));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['view_fournisseur'];
  } else {
    print('Failed to load data: ${response.statusCode}');
    return [];
  }
}

Future<List> fetchData() async {
  final response = await http.get(Uri.parse(API));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return [data];
  } else {
    print('Failed to load data: ${response.statusCode}');
    return [];
  }
}
