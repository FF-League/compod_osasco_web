import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsItemWidgetDescription extends AnimatedContainer {
  FormsItemWidgetDescription({required Duration duration, required bool isOpen, required double height, required String content})
      : super(
          width: double.infinity,
          margin: EdgeInsets.all(4.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
          duration: duration,
          height: isOpen ? height : 0,
          child: Text(content),
        );
}
