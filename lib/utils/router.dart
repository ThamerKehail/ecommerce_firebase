import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/auth/login_screen.dart';
import 'package:firebase_ecommerce/view/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.signupScreen:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    default:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }
}
