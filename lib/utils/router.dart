import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/auth/login_screen.dart';
import 'package:firebase_ecommerce/view/screens/auth/sign_up_screen.dart';
import 'package:firebase_ecommerce/view/screens/cart/cart_screen.dart';
import 'package:firebase_ecommerce/view/screens/home/home_screen.dart';
import 'package:firebase_ecommerce/view/screens/list_product/list_product_screen.dart';
import 'package:firebase_ecommerce/view/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.cartScreen:
      return MaterialPageRoute(builder: (_) => const CartScreen());
    case AppRoutes.productDetailsScreen:
      return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
    case AppRoutes.listProductScreen:
      return MaterialPageRoute(builder: (_) => const ListProductScreen());
    case AppRoutes.homesScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.signupScreen:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    default:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
