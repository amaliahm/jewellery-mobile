import 'package:flutter/material.dart';

class Magasin extends StatefulWidget {
  const Magasin({super.key});

  @override
  State<Magasin> createState() => _MagasinState();
}

class _MagasinState extends State<Magasin> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("magasin"),
    );
  }
}
