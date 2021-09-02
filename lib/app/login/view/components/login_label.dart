import 'package:compod_osasco_web/commons/app_fonts.dart';
import 'package:flutter/cupertino.dart';

class LoginLabel extends Text {
  static const loginStyle = TextStyle(fontFamily: Palanquin, fontSize: 16.0);

  LoginLabel(String data) : super(data, style: loginStyle);
}
