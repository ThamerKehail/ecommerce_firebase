import 'package:firebase_ecommerce/utils/const.dart';
import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/auth/auth_view_model.dart';
import 'package:firebase_ecommerce/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<SignupViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 450,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Form(
                key: auth.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomTextField(
                      hintText: "UserName",
                      validator: (value) {
                        if (value!.length < 6) {
                          return "UserName Is Too Short";
                        } else if (value.isEmpty) {
                          return "Please Fill UserName";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      hintText: "Email",
                      controller: auth.email,
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
                      controller: auth.password,
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
                    CustomTextField(
                      hintText: "Phone Number",
                      validator: (value) {
                        if (value!.length < 10) {
                          return "Phone Number Is Too Short";
                        } else if (value.isEmpty) {
                          return "Please Fill UserName";
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                        onTap: () {
                          auth.signupValidate();
                        },
                        text: "Register"),
                    Row(
                      children: [
                        const Text("I already have Account!"),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.loginScreen);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
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
