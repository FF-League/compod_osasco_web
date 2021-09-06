import 'package:compod_osasco_web/app/login/view/components/login_label.dart';
import 'package:flutter/material.dart';

class LoginButton extends MaterialButton {

  LoginButton({required Function() onPressed})
      : super(
          height: 48.0,
          minWidth: 128.0,
          onPressed: onPressed,
          child: Text('Entrar', style: LoginLabel.loginStyle),
        );
}
