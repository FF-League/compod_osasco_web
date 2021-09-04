import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FormsItemWidgetLabel extends Column {
  FormsItemWidgetLabel({required String text})
      : super(
          children: [
            Container(
              width: 120.0,
              child: Text(
                text,
                style: GoogleFonts.palanquin(fontSize: 16.0, height: 1.0),
              ),
            ),
            SizedBox(width: 32.0),
          ],
        );
}
