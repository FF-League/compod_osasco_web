import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormsItemWidgetLabel extends Column {
  final dynamic text;
  FormsItemWidgetLabel({required this.text, required bool viewed})
      : super(
          children: [
            Container(
              width: 120.0,
              child: Text(
                _convertToText(text),
                style: viewed ? GoogleFonts.palanquin(fontSize: 16.0, height: 1.0) : GoogleFonts.palanquin(fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.0)
              ),
            ),
            SizedBox(width: 32.0),
          ],
        );

  static String _convertToText(dynamic text) {
    if (text is String) {
      return text;
    } else if (text is DateTime) {
      DateTime dateTime = text;
      final today = DateTime.now();
      if (dateTime.day == today.day &&
          dateTime.month == today.month &&
          dateTime.year == today.year) {
        return DateFormat('hh:mm').format(dateTime);
      }
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
    return text.toString();
  }
}
