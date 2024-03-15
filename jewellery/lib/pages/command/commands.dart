import 'package:flutter/material.dart';

class Commands extends StatefulWidget {
  const Commands({super.key});

  @override
  State<Commands> createState() => _CommandsState();
}

class _CommandsState extends State<Commands> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("commands"),);
  }
}