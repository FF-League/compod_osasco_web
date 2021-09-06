import 'package:compod_osasco_web/app/database_page/model/form_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsItemWidgetDescription extends Container {
  FormsItemWidgetDescription({required bool isOpen, required FormItemModel content})
      : super(
          width: double.infinity,
          margin: EdgeInsets.all(4.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
          child: Column(
            children: [
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('${content.name}, ${content.sex}, ${content.age} anos'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('${content.phone}, ${content.job}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('${content.address}'))),
              Flexible(fit: FlexFit.loose, child: Container(width: double.infinity, child: Text('${content.text}'))),
            ],
          ),
        );
}
