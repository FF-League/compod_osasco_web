import 'package:compod_osasco_web/app/commons/routes.dart';
import 'package:compod_osasco_web/app/commons/storage.dart';
import 'package:compod_osasco_web/app/login/view/components/login_error_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var pass = ''.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    clearAuthState();
    super.onInit();
  }

  void clearAuthState() {
    Storage.box.remove('token');
  }

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email.value, password: pass.value).then((value) {
        Storage.saveToken(value.user?.refreshToken);
        return Get.toNamed(Routes.dashboard.route);
      }).catchError((error, stackTrace) {
        Get.defaultDialog(
            title: 'Erro',
            middleText: 'Conta não encontrada ou senha incorreta',
            confirm: LoginErrorDialogButton());
      });
    }
  }
}
