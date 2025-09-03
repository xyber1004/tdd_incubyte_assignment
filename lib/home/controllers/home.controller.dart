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

    String delimiter = ',';
    String numbersToProcess = numbers;

    if (numbers.startsWith('//')) {
      final lines = numbers.split('\n');
      if (lines.length >= 2) {
        delimiter = lines[0].substring(2);
        numbersToProcess = lines.sublist(1).join('\n');
      }
    }

    final cleanedNumbers = numbersToProcess.replaceAll('\n', delimiter);
    final numList = cleanedNumbers.split(delimiter).map(int.parse).toList();

    // Check for negative numbers
    final negativeNumbers = numList.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      final negativeNumbersStr = negativeNumbers.join(',');
      throw Exception('negative numbers not allowed $negativeNumbersStr');
    }

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
