import 'package:firebase_ecommerce/utils/const.dart';
import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/auth/auth_view_model.dart';
import 'package:firebase_ecommerce/view/widgets/custom_button.dart';
import 'package:firebase_ecommerce/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<SignupViewModel>();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 350,
              width: double.infinity,
              child: Form(
                key: auth.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextField(
                      controller: auth.emailLogin,
                      hintText: "Email",
                      validator: (value) {
                        if (!RegExp(emailRegExp).hasMatch(value!)) {
                          return "Enter Valid Email";
                        } else if (value.isEmpty) {
                          return "Please Fill Email";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: auth.passwordLogin,
                      hintText: "Password",
                      obscure: auth.obscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            // FocusScope.of(context).unfocus();
                            auth.changeObscure();
                          },
                          icon: Icon(auth.obscure
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password Is Too Short";
                        } else if (value.isEmpty) {
                          return "Please Fill Password";
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                        onTap: () {
                          auth.loginValidate();
                        },
                        text: "Login"),
                    Row(
                      children: [
                        const Text("I don't have Account!"),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.signupScreen, (route) => false);
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
