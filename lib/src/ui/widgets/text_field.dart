import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src/ui/widgets/text_field_container.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const CustomInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kIconColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kIconColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
