import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var pass = ''.obs;

  Future<UserCredential> login() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.value, password: pass.value);
  }


}