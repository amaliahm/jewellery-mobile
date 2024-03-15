import 'package:flutter/material.dart';
import 'package:jewellery/widgets/style.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.blue,
          fontSize: 50,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
