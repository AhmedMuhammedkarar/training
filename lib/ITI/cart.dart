import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  var count = 0;

  void onUpdate(int delta) {
    count += delta;
    notifyListeners();
  }
}