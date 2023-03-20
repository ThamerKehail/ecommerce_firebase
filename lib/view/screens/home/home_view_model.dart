import 'package:firebase_ecommerce/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool contactUsSelected = false;
  bool aboutSelected = false;
  bool cartSelected = false;
  bool homeSelected = true;
  void changeSelected(int selected) {
    if (selected == 0) {
      homeSelected = !homeSelected;
      contactUsSelected = false;
      aboutSelected = false;
      cartSelected = false;

      notifyListeners();
    } else if (selected == 1) {
      contactUsSelected = false;
      aboutSelected = false;

      homeSelected = false;
      cartSelected = !cartSelected;
      notifyListeners();
    } else if (selected == 2) {
      contactUsSelected = false;

      cartSelected = false;
      homeSelected = false;
      aboutSelected = !aboutSelected;
      notifyListeners();
    } else {
      aboutSelected = false;
      cartSelected = false;
      homeSelected = false;
      contactUsSelected = !contactUsSelected;
      notifyListeners();
    }
  }

  final List<CategoryModel> categories = [
    CategoryModel(name: "Shirt", onTap: 'shirt', icon: Icons.person),
    CategoryModel(name: "Dress", onTap: 'dress', icon: Icons.person),
    CategoryModel(name: "Pant", onTap: 'pant', icon: Icons.person),
    CategoryModel(name: "Shoes", onTap: 'shoes', icon: Icons.person),
    CategoryModel(name: "Tie", onTap: 'tie', icon: Icons.person),
  ];
}
