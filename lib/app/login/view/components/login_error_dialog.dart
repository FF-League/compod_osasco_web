import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginErrorDialogButton extends Container {
  LoginErrorDialogButton()
      : super(
          color: Get.theme.accentColor,
          child: MaterialButton(
            onPressed: () => Get.back(),
            child: Text('OK', style: Get.textTheme.button),
          ),
        );
}
