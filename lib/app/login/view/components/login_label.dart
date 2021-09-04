import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginLabel extends Text {
  static final loginStyle = GoogleFonts.palanquin(fontSize: 16.0);

  LoginLabel(String data) : super(data, style: loginStyle);
}
