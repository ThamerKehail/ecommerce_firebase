import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SignupViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  void signupValidate() async {
    try {
      if (formKey.currentState!.validate()) {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text);
        debugPrint(result.user!.uid);
      } else {
        debugPrint("Not Validate");
      }
    } on PlatformException catch (e) {
      debugPrint(e.message.toString());
    }
  }

  void loginValidate() async {
    try {
      if (formKey.currentState!.validate()) {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailLogin.text, password: passwordLogin.text);
        debugPrint(result.user!.email);
      } else {
        debugPrint("Not Validate");
      }
    } on PlatformException catch (e) {
      debugPrint(e.message.toString());
    }
  }

  bool obscure = true;
  void changeObscure() {
    obscure = !obscure;
    notifyListeners();
  }
}
