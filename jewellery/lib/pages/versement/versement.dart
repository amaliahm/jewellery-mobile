import 'package:flutter/material.dart';

class Versement extends StatefulWidget {
  const Versement({super.key});

  @override
  State<Versement> createState() => _VersementState();
}

class _VersementState extends State<Versement> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Versement"),);
  }
}