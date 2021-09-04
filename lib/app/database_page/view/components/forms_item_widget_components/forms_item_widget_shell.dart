import 'package:flutter/material.dart';

class FormsItemWidgetShell extends Container {
  FormsItemWidgetShell({required Widget child, required Color color})
      : super(
          child: child,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black45)],
          ),
        );
}
