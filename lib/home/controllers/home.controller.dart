import 'package:flutter/material.dart';
import 'package:tdd_incubyte_assignment/home/controllers/home.i.dart';
import 'package:tdd_incubyte_assignment/home/providers/home_provider.dart';

class HomeController implements IHome {
  HomeProvider _homeProvider = HomeProvider();
  TextEditingController _numController = TextEditingController();

  @override
  HomeProvider get homeProvider => _homeProvider;

  @override
  TextEditingController get numController => _numController;

  @override
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final cleanedNumbers = numbers.replaceAll('\n', ',');
    final numList = cleanedNumbers.split(',').map(int.parse).toList();
    int sum = 0;
    for (int i = 0; i < numList.length; i++) {
      sum += numList[i];
    }
    return sum;
  }

  @override
  void parseSum() {
    final numbers = _numController.text;
    final sum = add(numbers);
    _homeProvider.updateNumText(sum.toString());
  }

  @override
  void clear() {
    _numController.clear();
    _homeProvider.updateNumText("0");
  }
}
