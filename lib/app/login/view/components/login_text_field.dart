import 'package:compod_osasco_web/app/login/controller/login_controller.dart';
import 'package:compod_osasco_web/app/login/view/components/login_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({required this.type});

  final LoginController controller = Get.find();
  final LoginTextFieldType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      style: LoginLabel.loginStyle.copyWith(fontSize: 16.0),
      obscureText: type == LoginTextFieldType.password,
      onChanged: (v) => LoginTextFieldType.email == type ? controller.email.value = v : controller.pass.value = v,
      enableSuggestions: false,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) {
        if (v?.isBlank ?? true) return 'Este campo não pode estar vazio';
        if (type == LoginTextFieldType.email && (!v!.contains('@') || !v.contains('.'))) return 'Insira um e-mail válido';
        return null;
      },
    );
  }
}

enum LoginTextFieldType {
  email,
  password
}