import 'package:flutter/material.dart';

class FormsItemWidgetShell extends Container {
  FormsItemWidgetShell({required Widget child, required Color color})
      : super(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: child,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.black54)],
          ),
        );
}
