import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/widgets/style.dart';

class TextFiledWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final TextInputType input_type;
  final String hint_text;
  final bool error;
  final String notError;
  final IconData icon;
  final bool hide;
  const TextFiledWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.input_type = TextInputType.name,
    required this.hint_text,
    required this.error,
    required this.notError,
    required this.icon,
    this.hide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: input_type,
        obscureText: hide,
        decoration: InputDecoration(
          hintText: hint_text,
          errorText: error ? notError : null,
          hintStyle: const TextStyle(color: AppTheme.blue),
          prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                color: AppTheme.blue,
              )),
        ),
      ),
    );
  }
}
