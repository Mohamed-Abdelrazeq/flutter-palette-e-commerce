import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';

class SearchResultDisplayController extends ChangeNotifier {
  String screenName = "Home";
  bool isFound = false;
  List<MainCard> results = [];

  void setIsFound(bool isReallyFound) {
    this.isFound = isReallyFound;
    notifyListeners();
  }

  void setScreenName(String currentScreenName) {
    this.screenName = currentScreenName;
    notifyListeners();
  }

  void setResults(List<MainCard> newResults) {
    this.results = newResults;
    notifyListeners();
  }

  void reset(){
    screenName = "Home";
    isFound = false;
    results = [];
  }
}
