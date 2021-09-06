import 'package:compod_osasco_web/app/app.dart';
import 'package:compod_osasco_web/app/commons/storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  Storage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
