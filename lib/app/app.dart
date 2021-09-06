import 'package:compod_osasco_web/app/commons/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'COMPOD ADMIN',
      theme: ThemeData(
        textTheme: GoogleFonts.palanquinTextTheme(),
        primarySwatch: Colors.indigo,
        accentColor: Colors.greenAccent,
      ),
      initialRoute: Routes.home.route,
      getPages: appRoutes,
    );
  }
}
