import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function onTap;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 75.0,
        ),
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(fontSize: 16.0, color: Color(0xff111111)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login ? "Sign Up" : "LogIn",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xffFF1C98),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
