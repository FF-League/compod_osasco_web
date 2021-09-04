import 'package:compod_osasco_web/app/database_page/view/database_view.dart';
import 'package:compod_osasco_web/app/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.palanquinTextTheme(),
        primarySwatch: Colors.indigo,
        accentColor: Colors.greenAccent,
      ),
      home: DatabaseView(),
    );
  }
}
