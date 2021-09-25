import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsItemWidgetArrow extends GetView {
  const FormsItemWidgetArrow({required this.isOpen});

  final bool isOpen;

  @override
  Widget build(BuildContext context) => Icon(isOpen ? Icons.arrow_drop_down : Icons.arrow_right, size: 40.0);
}
