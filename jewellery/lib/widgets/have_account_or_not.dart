import 'package:flutter/material.dart';
import 'package:jewellery/widgets/style.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Login",
            style: const TextStyle(
              color: AppTheme.blue,
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
        )
      ],
    );
  }
}