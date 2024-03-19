// ignore_for_file: avoid_print, constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class Book {
  final int id;
  final String title;
  final String author;

  Book({required this.id, required this.title, required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
    );
  }
}

List<Book> books = [];

const API = 'http://192.168.43.136:3000/';

fetch_view_client() async {
  final response = await http.get(Uri.parse(API));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var client = data['view_client'];
    print('client');
    print(client);
    return [data['view_client']];
  } else {
    print('Failed to load data: ${response.statusCode}');
    return [];
  }
}

Future<void> fetchData() async {
  final response = await http.get(Uri.parse(API));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
  } else {
    print('Failed to load data: ${response.statusCode}');
  }
}
