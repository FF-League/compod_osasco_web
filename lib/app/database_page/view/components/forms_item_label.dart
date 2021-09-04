import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FormsItemLabel extends Text {
  static final formsItemStyle = GoogleFonts.palanquin(
    fontSize: 14.0,
  );

  FormsItemLabel(String data)
      : super(
          data,
          style: formsItemStyle
        );
}
