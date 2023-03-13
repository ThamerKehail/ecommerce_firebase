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
}
