import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String _numText = "0";

  String get numText => _numText;

  void updateNumText(String newText) {
    _numText = newText;
    notifyListeners();
  }
}
