import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/shopping.png'),
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Text(
            "Ready To Start Shoping Sign up",
            style: TextStyle(fontSize: 18),
          ),
          const Text(
            "To get Started",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.signupScreen);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("I already have Account!"),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.loginScreen);
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
          ),
        ],
      ),
    );
  }
}
