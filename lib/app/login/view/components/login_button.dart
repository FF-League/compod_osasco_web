import 'package:compod_osasco_web/app/login/controller/login_controller.dart';
import 'package:compod_osasco_web/app/login/view/components/login_label.dart';
import 'package:flutter/material.dart';

class LoginButton extends MaterialButton {
  final GlobalKey<FormState> key;

  LoginButton({required LoginController controller, required this.key})
      : super(
          onPressed: () {
            if (key.currentState?.validate() ?? false) controller.login();
          },
          child: Text('Login', style: LoginLabel.loginStyle.copyWith(color: Colors.cyanAccent),),
        );
}
