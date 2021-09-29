import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormsItemWidgetLabel extends GetView {
  final dynamic text;
  final double? size;
  final bool viewed;

  const FormsItemWidgetLabel({required this.text, required this.viewed, this.size});

  static String _convertToText(dynamic text) {
    if (text is DateTime) {
      final dateTime = text.subtract(Duration(hours: 3));
      if (DateTime.now().difference(dateTime).inHours < 24) {
        return DateFormat('HH:mm').format(dateTime);
      }
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
    return text.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: size ?? 200.0),
      child: Text(
        _convertToText(text),
        textAlign: TextAlign.start,
        style: viewed ? GoogleFonts.palanquin(fontSize: 16.0, height: 1.0) : GoogleFonts.palanquinDark(fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.0),
      ),
    );
  }
}
