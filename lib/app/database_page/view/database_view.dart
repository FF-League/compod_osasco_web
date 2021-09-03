import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.all(32.0),
        padding: EdgeInsets.all(16.0),
        child: Center(
         child: ListView(),
        ),
      ),
    );
  }

}