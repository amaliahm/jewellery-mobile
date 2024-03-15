import 'package:flutter/widgets.dart';

class TotalVente extends StatefulWidget {
  const TotalVente({super.key});

  @override
  State<TotalVente> createState() => _TotalVenteState();
}

class _TotalVenteState extends State<TotalVente> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('total vente'),
    );
  }
}
