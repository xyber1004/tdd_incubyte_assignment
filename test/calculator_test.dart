import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_incubyte_assignment/home/controllers/home.controller.dart';
import 'package:tdd_incubyte_assignment/home/controllers/home.i.dart';

void main() {
  late IHome controller;

  setUp(() {
    controller = HomeController();
  });

  test('0 for empty string', () {
    expect(controller.add(''), 0);
  });

  test('single number returns itself', () {
    expect(controller.add('5'), 5);
  });

  test('2 numbers return sum', () {
    expect(controller.add('2,3'), 5);
  });

  test('more than 2 numbers return sum', () {
    expect(controller.add('1,2,3'), 6);
  });

  test('handle new lines between numbers', () {
    expect(controller.add('1\n2,3'), 6);
  });
}
