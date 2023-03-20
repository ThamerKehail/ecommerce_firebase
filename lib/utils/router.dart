import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/auth/login_screen.dart';
import 'package:firebase_ecommerce/view/screens/auth/sign_up_screen.dart';
import 'package:firebase_ecommerce/view/screens/cart/cart_screen.dart';
import 'package:firebase_ecommerce/view/screens/checkout/checkout_screen.dart';
import 'package:firebase_ecommerce/view/screens/home/home_screen.dart';
import 'package:firebase_ecommerce/view/screens/list_product/list_product_screen.dart';
import 'package:firebase_ecommerce/view/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

import '../view/screens/welcome/w_elcome_screen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.checkoutScreen:
      return MaterialPageRoute(builder: (_) => const CheckoutScreen());
    case AppRoutes.cartScreen:
      return MaterialPageRoute(builder: (_) => const CartScreen());
    case AppRoutes.productDetailsScreen:
      return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());

    case AppRoutes.homesScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.signupScreen:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return const WelcomeScreen();
                }
              }));
  }
}
