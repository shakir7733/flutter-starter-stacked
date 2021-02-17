import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/text_field_container.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';

class CustomPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CustomPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kIconColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kIconColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kIconColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
