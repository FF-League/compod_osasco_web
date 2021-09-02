
import 'package:compod_osasco_web/app/login/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class
App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.greenAccent
      ),
      home: LoginView(),
    );
  }
}
