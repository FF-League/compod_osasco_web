import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var pass = ''.obs;

  void login() async {
    var futureCredential = FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.value, password: pass.value);

    futureCredential
        // .then((value) => Get.to(page))
        .catchError((error, stackTrace) {
      Get.defaultDialog(title: 'Erro', middleText: 'Conta não encontrada ou senha incorreta');
    });
  }
}
