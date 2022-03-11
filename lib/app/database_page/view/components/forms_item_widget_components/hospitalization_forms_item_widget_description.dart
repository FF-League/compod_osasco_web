import 'package:compod_osasco_web/app/database_page/model/hospitalization_form_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalizationFormsItemWidgetDescription extends GetView {
  HospitalizationFormsItemWidgetDescription({required this.isOpen, required this.content});

  final bool isOpen;
  final HospitalizationFormItemModel content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(color: Colors.white54, width: 1.0),
          borderRadius: BorderRadius.vertical(top: Radius.circular(4.0), bottom: Radius.circular(12.0)),
        ),
        child: DefaultTextStyle(
          style: GoogleFonts.palanquin(fontSize: 14.0),
          child: Column(
            children: [
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('Nome: ${content.name}, ${content.age} anos'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('Gênero: ${content.sex.isEmpty ? 'Não informado' : content.sex}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('Tel: ${content.phone}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('E-mail: ${content.email}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('Profissão: ${content.job}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('${content.address}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('Descrição: \n${content.text}'))),
            ],
          ),
        ),
      ),
    );
  }
}
