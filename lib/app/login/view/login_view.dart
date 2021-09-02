import 'package:compod_osasco_web/app/login/controller/login_controller.dart';
import 'package:compod_osasco_web/app/login/view/components/login_button.dart';
import 'package:compod_osasco_web/app/login/view/components/login_label.dart';
import 'package:compod_osasco_web/app/login/view/components/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  final c = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COMPOD OSASCO ADMIN'),
      ),
      body: Card(

        child: Form(
          child: Column(
            children: [
              LoginLabel('E-mail'),
              LoginTextField(type: LoginTextFieldType.email),
              LoginLabel('Senha'),
               LoginTextField(type: LoginTextFieldType.password),
              LoginButton(controller: c, key: formKey)
            ]
          ),
        ),
      ),
    );
  }
}
