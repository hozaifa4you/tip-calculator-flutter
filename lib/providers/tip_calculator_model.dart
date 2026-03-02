import 'package:flutter/material.dart';

class TipCalculatorModel with ChangeNotifier {
  int _personCount = 1;
  double _tipPercentage = 10.0;
  double _billTotal = 100.00;

  // getters
  double get billTotal => _billTotal;
  double get tipPercentage => _tipPercentage;
  int get personCount => _personCount;

  void updateBillTotal(double value) {
    _billTotal = value;
    notifyListeners();
  }

  void updateTipPercentage(double value) {
    _tipPercentage = value;
    notifyListeners();
  }

  void updatePersonCount(int value) {
    _personCount = value;
    notifyListeners();
  }

  double get tipAmount => _billTotal * _tipPercentage / 100;

  double get totalPerPerson {
    return (_billTotal + tipAmount) / _personCount;
  }
}
