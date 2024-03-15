import 'package:flutter/widgets.dart';

class Fournisseur extends StatefulWidget {
  const Fournisseur({super.key});

  @override
  State<Fournisseur> createState() => _FournisseurState();
}

class _FournisseurState extends State<Fournisseur> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("fournisseur"));
  }
}
