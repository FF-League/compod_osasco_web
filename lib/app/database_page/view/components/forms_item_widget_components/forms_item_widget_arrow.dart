import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsItemWidgetArrow extends Icon {
  FormsItemWidgetArrow({required bool isOpen})
      : super(
          isOpen ? Icons.arrow_drop_down : Icons.arrow_right,
          size: 40.0,
        );
}
