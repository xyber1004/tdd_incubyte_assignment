import 'package:flutter/material.dart';
import 'package:tdd_incubyte_assignment/home/providers/home_provider.dart';

abstract class IHome {
  int add(String numbers);
  void parseSum();
  void clear();
  HomeProvider get homeProvider;
  TextEditingController get numController;
}
