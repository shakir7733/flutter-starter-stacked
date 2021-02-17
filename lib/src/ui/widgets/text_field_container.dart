import 'package:flutter/material.dart';
import 'package:flutter_starter_stacked/src/constants/constants.dart';
import 'package:flutter_starter_stacked/src/ui/shared/shared_styles.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // padding: fieldPadding,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kInputBgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: kInputBorderColor)),
      child: child,
    );
  }
}
