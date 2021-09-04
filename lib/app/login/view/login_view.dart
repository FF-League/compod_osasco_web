import 'package:compod_osasco_web/app/login/controller/login_controller.dart';
import 'package:compod_osasco_web/app/login/view/components/login_button.dart';
import 'package:compod_osasco_web/app/login/view/components/login_label.dart';
import 'package:compod_osasco_web/app/login/view/components/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView {
  final c = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      appBar: AppBar(
        title: Text('COMPOD OSASCO ADMIN', style: GoogleFonts.palanquinDark(fontSize: 24.0)),
      ),
      body: Center(
        child: Card(
          elevation: 6.0,
          child: Container(
            padding: const EdgeInsets.all(32.0),
            height: 400,
            width: 600,
            child: Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginLabel('Conta'),
                    LoginTextField(type: LoginTextFieldType.email),
                    LoginLabel('Senha'),
                    LoginTextField(type: LoginTextFieldType.password),
                    LoginButton(controller: c, key: formKey)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
