import 'package:flutter/widgets.dart';

class Retour extends StatefulWidget {
  const Retour({super.key});

  @override
  State<Retour> createState() => _RetourState();
}

class _RetourState extends State<Retour> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("retour"),
    );
  }
}
