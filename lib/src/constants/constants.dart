import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF47DD8E);
const kIconColor = Color(0xFFcfcfcf);
const kPrimaryLightColor = Color(0xFFFA45FE6);
const kInputBgColor = Color(0xFFffffff);
const kInputBorderColor = Color(0xFFDBDADA);

const kCalcLabelText = TextStyle(
    fontSize: 22.0, color: kInputBgColor, fontWeight: FontWeight.w400);

const kBoxHeadingTextStyle = TextStyle(
  fontSize: 40.0,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 2.0,
      color: Color.fromARGB(40, 0, 0, 0),
    ),
  ],
  color: Color(0xff33C58E),
  fontWeight: FontWeight.bold,
);

const kBackgroundGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xff33C58E),
    Color(0xff49DF8B),
    Color(0xff63FD88),
  ],
);

const kLogo = Image(image: AssetImage('assets/images/map.png'));
