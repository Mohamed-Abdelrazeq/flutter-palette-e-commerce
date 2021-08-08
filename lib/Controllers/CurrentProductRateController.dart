import 'package:flutter/material.dart';

class CurrentProductRateController extends ChangeNotifier{
  double currentRate = 0;
  setCurrentRate({double rate}){
    currentRate = rate;
    notifyListeners();
  }
}