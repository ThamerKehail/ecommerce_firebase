import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  List<String> size = ["S", "M", "L", "XL"];
  List<Color> color = [Colors.blue, Colors.yellow, Colors.red, Colors.green];

  int quantity = 0;

  addQuantity() {
    quantity++;
    notifyListeners();
  }

  removeQuantity() {
    quantity == 0 ? null : quantity--;
    notifyListeners();
  }
}
